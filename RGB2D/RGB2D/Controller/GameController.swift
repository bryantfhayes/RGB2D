//
//  GameController.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/18/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

extension GameScene {
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        let nodes = _tileArea.nodes(at: pos)
        for node in nodes {
            if let tileNode = node as? TileNode {
                GameManager.instance.selectTile(x: tileNode.tile.x, y: tileNode.tile.y)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
