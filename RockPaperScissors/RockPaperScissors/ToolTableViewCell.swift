//
//  ToolTableViewCell.swift
//  RockPaperScissors
//
//  Created by Raphael Berendes on 08.04.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

import UIKit

class ToolTableViewCell: UITableViewCell {
    
    @IBOutlet weak var toolImageView: UIImageView!
    
    func setImage(for tool: Tool) {
        
        var toolImage: UIImage?
        
        switch tool {
        case .rock:
            toolImage = UIImage(named: "rock")
        case .paper:
            toolImage = UIImage(named: "paper")
        case .scissors:
            toolImage = UIImage(named: "scissors")
        }
        
        guard let image = toolImage else { return }
        toolImageView.image = image
    }
    
}
