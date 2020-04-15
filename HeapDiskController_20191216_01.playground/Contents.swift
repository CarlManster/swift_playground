import UIKit

struct JobItem: CustomStringConvertible, Comparable {
    static func < (lhs: JobItem, rhs: JobItem) -> Bool {
        if lhs.jobTime == rhs.jobTime {
            return lhs.requested < rhs.requested
        } else {
            return lhs.jobTime < rhs.jobTime
        }
    }
    
    let requested: Int
    let jobTime: Int
    
    init?(job: [Int]) {
        guard job.count >= 2 else { return nil }
        requested = job[0]
        jobTime = job[1]
    }
    
    var description: String {
        return "requested == \(requested), jobTime == \(jobTime)"
    }
}

func solution(_ jobs: [[Int]]) -> Int {
    var result: Int = 0
    var structedJobs = jobs.compactMap { return JobItem(job: $0) }.sorted()
    
    var time: Int = 0
    while structedJobs.count > 0 {
        for (index, item) in structedJobs.enumerated() {
            if time >= item.requested {
                time += item.jobTime
                result += time - item.requested
                structedJobs.remove(at: index)
                break
            }
            
            if index == structedJobs.count - 1 {
                time += 1
            }
        }
    }
    
    result /= jobs.count
    
    return result
}

struct QuestionSet {
    let jobs: [[Int]]
    
    func ask() {
        print("result of jobs \(jobs)\n\t==> \(solution(jobs))")
    }
}

let q1 = QuestionSet(jobs: [[0, 3], [1, 9], [2, 6], [3, 6]])
let q2 = QuestionSet(jobs: [[0, 2], [4, 3], [5, 7]])

q1.ask()
q2.ask()
