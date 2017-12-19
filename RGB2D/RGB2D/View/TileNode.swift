//
//  TileNode.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/17/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import Foundation
import SpriteKit

class TileNode: SKShapeNode {
    
    var _tile: Tile
    var _strokeWidth: CGFloat = 3
    var _strokeColor: UIColor = UIColor.white
    
    var tile: Tile {
        return _tile
    }
    
    init(tile: Tile, rect: CGRect) {
        _tile = tile
        
        // Init SKShapeNode
        super.init()
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = colorForTileState(state: tile.state)
        self.strokeColor = _strokeColor
        self.lineWidth = _strokeWidth
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
