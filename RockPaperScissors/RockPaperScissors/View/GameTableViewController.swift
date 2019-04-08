//
//  GameTableViewController.swift
//  RockPaperScissors
//
//  Created by Raphael Berendes on 08.04.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

import UIKit

import UIKit

class GameTableViewController: UITableViewController {
    
    var gameController: GameController?
    
    let toolCellIdentifier = "toolCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ToolTableViewCell", bundle: nil), forCellReuseIdentifier: toolCellIdentifier)
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tool.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        if #available(iOS 11.0, *) {
            height = view.safeAreaLayoutGuide.layoutFrame.height
        } else {
            let statusBarHeight = UIApplication.shared.statusBarFrame.height
            height = view.frame.height - statusBarHeight
            tableView.contentInset.top = statusBarHeight
            tableView.scrollIndicatorInsets.top = statusBarHeight
        }
        
        return height / CGFloat(Tool.count)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tool = Tool(rawValue: indexPath.row) else {
            fatalError("Unexpected additional row")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: toolCellIdentifier, for: indexPath) as! ToolTableViewCell
        cell.setImage(for: tool)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let tool = Tool(rawValue: indexPath.row) else {
            fatalError("Unexpected additional row")
        }
        
        gameController = GameController()
        gameController?.delegate = self
        gameController?.startGame(with: tool)
    }
    
}

extension GameTableViewController: GameControllerDelegate {
    
    func gameDidFinishGame(_ game: Game) {
        
        let title = game.result
        let message = "Opponent chose \(game.computerTool)"
        
        let alertController = UIAlertController(title: title.rawValue, message: message, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Play Again", style: .default)
        alertController.addAction(retryAction)
        
        present(alertController, animated: true)
    }
    
}
