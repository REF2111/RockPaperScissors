//
//  GameController.swift
//  RockPaperScissors
//
//  Created by Raphael Berendes on 08.04.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

import UIKit

protocol GameControllerDelegate: class {
    func gameDidFinishGame(_ game: Game)
}

class GameController: NSObject {
    
    weak var delegate: GameControllerDelegate?
    
    var randomTool: Tool {
        
        let randomNumber = Int(arc4random_uniform(UInt32(Tool.count)))
        guard let tool = Tool(rawValue: randomNumber) else {
            fatalError("Unexpected out of range")
        }
        
        return tool
    }
    
    func startGame(with tool: Tool) {
        
        let game = Game(playerTool: tool, computerTool: randomTool)
        delegate?.gameDidFinishGame(game)
    }
    
}
