import Cocoa
import Combine

final class ElapsedTimer {
    private let dateFormatter: DateFormatter
    
    private var timer: Cancellable?
    
    init(dateFormatter: DateFormatter? = nil) {
        self.dateFormatter = dateFormatter ?? {
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "HH:mm:ss.SSS"
            return formatter
        }()
    }
    
    func invalidate() {
        timer?.cancel()
        timer = nil
    }
    
    @discardableResult
    func start(for timeInterval: TimeInterval, onTick: @escaping (String) -> Void) -> Cancellable {
        invalidate()
        
        let targetTime = Date().addingTimeInterval(timeInterval)
        
        let timerItem = DispatchQueue
                            .global(qos: .userInteractive)
                            .schedule(after: .init(.now()),
                                      interval: .milliseconds(10),
                                      tolerance: .milliseconds(1),
                                      options: nil, {
                                        DispatchQueue.main.async { [weak self] in
                                            guard let self = self else { return }
                                            
                                            let elapsedTimeInterval = max(0.0,  targetTime.timeIntervalSince(Date()))
                                            let elapsedDate = Date(timeIntervalSinceReferenceDate: elapsedTimeInterval)
                                            
                                            onTick(self.dateFormatter.string(from: elapsedDate))
                                            
                                            if elapsedTimeInterval <= 0.0 {
                                                self.invalidate()
                                            }
                                        }
                            })
        
        timer = timerItem
        
        return timerItem
    }
}

ElapsedTimer().start(for: 10.0) { (tickString) in
    print("tick == \(tickString)")
}
