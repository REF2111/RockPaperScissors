//
//  GameModel.swift
//  RockPaperScissors
//
//  Created by Raphael Berendes on 08.04.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

import Foundation

enum Tool: Int {
    case rock
    case paper
    case scissors
    
    static let count: Int = {
        var max: Int = 0
        while let _ = Tool(rawValue: max) { max += 1 }
        return max
    }()
}

enum GameResult: String {
    case win = "Win"
    case loss = "Loss"
    case draw = "Draw"
}

struct Game {
    
    let playerTool: Tool
    let computerTool: Tool
    
    var result: GameResult {
        switch playerTool {
        case .rock:
            switch computerTool {
            case .rock: return .draw
            case .paper: return .loss
            case .scissors: return .win
            }
        case .paper:
            switch computerTool {
            case .rock: return .win
            case .paper: return .draw
            case .scissors: return .loss
            }
        case .scissors:
            switch computerTool {
            case .rock: return .loss
            case .paper: return .win
            case .scissors: return .draw
            }
        }
    }
}

