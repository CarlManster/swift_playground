//: Playground - noun: a place where people can play

import UIKit

struct MineField {
    struct CoordValue: CustomStringConvertible {
        var mine: Bool = false
        var count: Int = 0
        
        var description: String {
            if mine == true {
                return "M"
            } else {
                return "\(count)"
            }
        }
    }
    
    var field: [[CoordValue]] = []
    var mines: [(Int, Int)] = []
    let width: Int
    let height: Int
    
    init(width: Int, height: Int, mines: [(Int, Int)]) {
        self.width = width
        self.height = height
        
        // Init Field
        for _ in 0..<width {
            var row: [CoordValue] = []
            for _ in 0..<height {
                row.append(CoordValue())
            }
            field.append(row)
        }
        
        // Set mine
        for mine in mines {
            if mine.0 >= 0, mine.0 < width, mine.1 >= 0, mine.1 < height {
                var value = field[mine.0][mine.1]
                if value.mine == false {
                    self.mines.append(mine)
                    
                    value.mine = true
                    field[mine.0][mine.1] = value
                    
                    // Set near mine count
                    for xPos in max(mine.0 - 1, 0)...min(width - 1, mine.0 + 1) {
                        for yPos in max(mine.1 - 1, 0)...min(height - 1, mine.1 + 1) {
                            var nearValue = field[xPos][yPos]
                            if nearValue.mine == false {
                                nearValue.count += 1
                                field[xPos][yPos] = nearValue
                            }
                        }
                    }
                }
            }
        }
    }
    
    func printValue() {
        print("\(width) x \(height) mine field with \(mines.count) valid mines")
        for row in field {
            print(row)
        }
        print("")
    }
}

var mineCoords1: [(Int, Int)] = [ (0, 0), (0, 5), (1, 7), (2, 7), (3, 6), (4, 5), (5, 0), (7, 9), (8, 9), (9, 7), (9, 9), (9, 8) ]
MineField(width: 10, height: 10, mines: mineCoords1).printValue()

var mineCoords2: [(Int, Int)] = [ (1, 2), (2, 1), (2, 2), (2, 2) ]
MineField(width: 3, height: 3, mines: mineCoords2).printValue()

var mineCoords3: [(Int, Int)] = [ (1, 2), (2, 1), (2, 2), (5, 5), (5, 6) ]
MineField(width: 6, height: 6, mines: mineCoords3).printValue()

var mineCoords4: [(Int, Int)] = []
MineField(width: 20, height: 20, mines: mineCoords4).printValue()


