import UIKit

func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    var waitingTrucks: [Int] = truck_weights
    var passingTrucks: [(weight: Int, time: Int)] = []
    var time: Int = 0
    
    while waitingTrucks.count + passingTrucks.count > 0 {
        time += 1
        passingTrucks = passingTrucks.compactMap { $0.time < bridge_length ? ($0.weight, $0.time + 1) : nil }
        
        if let waitingFirst = waitingTrucks.first,
            weight - (passingTrucks.reduce(0) { $0 + $1.weight }) >= waitingFirst {
            passingTrucks.append((waitingFirst, 1))
            waitingTrucks.remove(at: 0)
        }
    }
    
    return time
}

struct QuestionSet {
    let bridgeLength: Int
    let weightLimit: Int
    let truckWeights: [Int]
    
    func ask() {
        print("result of bridge length \(bridgeLength), weight limit \(weightLimit), truck weights \(truckWeights)\n\t==> \(solution(bridgeLength, weightLimit, truckWeights))")
    }
}

let q1 = QuestionSet(bridgeLength: 2, weightLimit: 10, truckWeights: [7,4,5,6])
let q2 = QuestionSet(bridgeLength: 100, weightLimit: 100, truckWeights: [10])
let q3 = QuestionSet(bridgeLength: 100, weightLimit: 100, truckWeights: [10,10,10,10,10,10,10,10,10,10])
let q4 = QuestionSet(bridgeLength: 100, weightLimit: 100, truckWeights: [20,20,20,20,20,20,20,20,20,20])

q1.ask()
q2.ask()
q3.ask()
q4.ask()
