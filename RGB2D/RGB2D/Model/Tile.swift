//
//  Tile.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/17/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import Foundation

class Tile {
    
    var _x: Int
    var _y: Int
    var _state: TileState
    
    var x: Int {
        return _x
    }
    
    var y: Int {
        return _y
    }
    
    var state: TileState {
        get {
            return _state
        }
        set {
            _state = newValue
        }
    }
    
    init(state: TileState, x: Int, y: Int) {
        _state = state
        _x = x
        _y = y
    }
}
