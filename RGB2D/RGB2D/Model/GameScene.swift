//
//  GameScene.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/13/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func update(_ currentTime: TimeInterval) {
        // Update color of each tile on the grid
        _tileArea.enumerateChildNodes(withName: "tile") { (node, _) in
            if let node = node as? TileNode {
                node.fillColor = colorForTileState(state: node.tile.state)
            }
        }
    }
}
