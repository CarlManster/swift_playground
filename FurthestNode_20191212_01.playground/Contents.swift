import Foundation

struct Node: CustomStringConvertible {
    var visited: Bool = false
    var related: [Int] = []
    var minDistance: Int = 0
    
    var description: String {
        return "visited == \(visited), minDistance == \(minDistance), related == \(related)"
    }
}

// Breadth-First Search
func solution(_ n: Int, _ edge: [[Int]]) -> Int {
    let nodesNumbers = stride(from: 1, to: n+1, by: 1)
    var nodes: [Int: Node] = [:]
    
    nodesNumbers.forEach { nodes[$0] = Node() }
    
    let compactedEdge = edge.compactMap { item -> (Int, Int)? in
        if let first = item.first, let last = item.last {
            return (first, last)
        }
        return nil
    }
    
    for relation in compactedEdge {
        nodes[relation.0]?.related.append(relation.1)
        nodes[relation.1]?.related.append(relation.0)
    }
    nodes[1]?.visited = true
    
    print("nodes created == \(nodes as AnyObject)")
    
    var queue: [Int] = [1]
    var currentDistance = 0
    
    while !queue.isEmpty {
        let item = queue.remove(at: 0)
        let newDistance = nodes[item]?.minDistance ?? 0
        currentDistance = newDistance
        for related in nodes[item]?.related ?? [] {
            if let relatedItem = nodes[related], !relatedItem.visited {
                nodes[related]?.visited = true
                nodes[related]?.minDistance = newDistance + 1
                queue.append(related)
            }
        }
    }
    
    print("nodes calculated == \(nodes as AnyObject)")
    
    return nodes.values.filter { $0.minDistance == currentDistance }.count
}

struct QuestionSet {
    let nodeCount: Int
    let vertex: [[Int]]
}

let question1 = QuestionSet(nodeCount: 10, vertex: [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2], [1, 7], [3, 8], [7, 9], [8, 10]])
let question2 = QuestionSet(nodeCount: 6, vertex: [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])

print("result 1 == \(solution(question1.nodeCount, question1.vertex))")
print("result 2 == \(solution(question2.nodeCount, question2.vertex))")

