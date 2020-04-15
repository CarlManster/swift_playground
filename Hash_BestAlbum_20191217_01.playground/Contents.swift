import UIKit

struct MusicItem: CustomStringConvertible {
    let number: Int
    let genre: String
    let playCount: Int
    
    var description: String {
        return "{ number == \(number), genre == \(genre), playCount == \(playCount) }"
    }
}

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    let allMusicItems = zip(genres, plays).enumerated().map { MusicItem(number: $0, genre: $1.0, playCount: $1.1) }
    
    return Array(Set(allMusicItems.map { $0.genre }))
        .map { genre -> (String, Int) in
            return (genre, allMusicItems.filter { $0.genre == genre }.reduce(0) { $0 + $1.playCount })
        }
        .sorted { $0.1 > $1.1 }
        .map { item -> [Int] in
            let genreItems = allMusicItems.filter { $0.genre == item.0 }.sorted { $0.playCount > $1.playCount }
            return (genreItems.count >= 2 ? Array<MusicItem>(genreItems[0..<2]) : genreItems).map { $0.number }
        }
        .reduce([]) { $0 + $1 }
}

struct QuestionSet {
    let genres: [String]
    let plays: [Int]
    
    func ask() {
        print("result of genres \(genres), plays \(plays)\n\t==> \(solution(genres, plays))")
    }
}

let q1 = QuestionSet(genres: ["classic", "pop", "classic", "classic", "pop"], plays: [500, 600, 150, 800, 2500])

q1.ask()
