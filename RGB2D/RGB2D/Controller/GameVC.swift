//
//  GameVC.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/13/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import UIKit
import SpriteKit

class GameVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gameView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        // Load game
        loadGameView()
    }
    
    func loadGameView() {
        // Force cast gameView to SKView
        if let skView = self.gameView as! SKView? {
    
            // Create Game Scene
            let scene = GameScene(size: view.bounds.size)
            
            // Configure Game Scene
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.ignoresSiblingOrder = false
            scene.scaleMode = .resizeFill
            skView.presentScene(scene)
        }
    }
}

extension GameVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 22
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorQueueCell") as? ColorQueueCell else { return UITableViewCell() }
        
        cell.configure()
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
