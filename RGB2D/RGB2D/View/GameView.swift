//
//  GameView.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/18/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var _width: CGFloat!
var _height: CGFloat!
var _tileHeight: CGFloat!
var _tileWidth: CGFloat!
var _tileArea: SKShapeNode!
var _tileAreaWidth: CGFloat!
var _tileAreaHeight: CGFloat!
var _horizontalOffset: CGFloat!
var _verticalOffset: CGFloat!
var _borderSize: CGFloat = 50.0

extension GameScene {
    
    override func didMove(to view: SKView) {
        initScene(view: view)
    }
    
    func initScene(view: SKView) {
        _width = view.bounds.width
        _height = view.bounds.height
        _tileAreaWidth = _width - (2 * _borderSize)
        _tileAreaHeight = _height - (2 * _borderSize)
        
        let tileAreaRect = CGRect(x: _borderSize, y: _borderSize, width: _tileAreaWidth, height: _tileAreaHeight)
        _tileArea = SKShapeNode.init(rect: tileAreaRect)
        _tileArea.strokeColor = UIColor.clear
        addChild(_tileArea)
        
        calculateTileSize(forGridSize: GameManager.instance.gridsize)
        for tile in GameManager.instance.tiles {
            let xPos = CGFloat(tile.x) * _tileWidth + _borderSize + _horizontalOffset
            let yPos = CGFloat(tile.y) * _tileHeight + _borderSize + _verticalOffset
            let tileRect = CGRect(x: xPos, y: yPos, width: _tileWidth, height: _tileHeight)
            let tileNode = TileNode(tile: tile, rect: tileRect)
            tileNode.name = "tile"
            _tileArea.addChild(tileNode)
        }
    }
    
    func calculateTileSize(forGridSize size: Int) {
        _tileHeight = _tileAreaHeight / CGFloat(size)
        _tileWidth = _tileAreaWidth / CGFloat(size)
        
        if (_tileWidth < _tileHeight) {
            _tileHeight = _tileWidth
            _verticalOffset = (_tileAreaHeight - (CGFloat(size) * _tileHeight)) / 2
            _horizontalOffset = 0.0
        } else {
            _tileWidth = _tileHeight
            _horizontalOffset = (_tileAreaWidth - (CGFloat(size) * _tileWidth)) / 2
            _verticalOffset = 0.0
        }
    }
}
