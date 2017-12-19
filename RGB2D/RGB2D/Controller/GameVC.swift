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

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gameView: UIView!
    
    // MARK: Variables
    var selectedLevel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register controller for GameManager HUD delegate so that the
        // GameManager can control the HUD
        GameManager.instance.gameHUDDelegate = self
        
        // Setup table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadGameView()
        tableView.reloadData()
    }
    
    @objc func update(notif: Notification) {
        tableView.reloadData()
    }
    
    func loadGameView() {
        GameManager.instance.reset(level: selectedLevel)

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
    
    @IBAction func backBtnPressed(_ sender: Any) {
        if let skView = self.gameView as! SKView? {
            skView.presentScene(nil)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension GameVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.instance.nextColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorQueueCell") as? ColorQueueCell else { return UITableViewCell() }
        
        let state = GameManager.instance.nextColors[indexPath.row]
        cell.configure(color: colorForTileState(state: state))
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension GameVC: GameHUDDelegate {
    func update() {
        tableView.reloadData()
    }
}
