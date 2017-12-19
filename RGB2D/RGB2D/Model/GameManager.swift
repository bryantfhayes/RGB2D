//
//  GameManager.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/13/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import Foundation

class GameManager {
    static let instance = GameManager()
    
    var gameHUDDelegate: GameHUDDelegate?
    
    var _tiles = [Tile]()
    var _gridsize: Int = 0
    var _nextColors = [TileState]()
    
    var nextColors: [TileState] {
        return _nextColors
    }
    
    var tiles: [Tile] {
        return _tiles
    }
    
    var gridsize: Int {
        return _gridsize
    }
    
    func reset(level: String) {
        // Clear old items
        _tiles.removeAll()
        _nextColors.removeAll()
        _gridsize = 0
        
        buildGrid(forLevel: level)
    }
    
    func tileAtPosition(x: Int, y: Int) -> Tile? {
        for tile in _tiles {
            if tile.x == x && tile.y == y {
                return tile
            }
        }
        return nil
    }
    
    func getSurroundingTiles(forTile tile: Tile) -> [Tile] {
        let surroundingPositions = [(x: tile.x-1, y: tile.y-1),
                                    (x: tile.x-1, y: tile.y+1),
                                    (x: tile.x+1, y: tile.y+1),
                                    (x: tile.x+1, y: tile.y-1)]
        
        var surroundingTiles = [Tile]()
        for t in _tiles {
            for position in surroundingPositions {
                if t.x == position.x && t.y == position.y {
                    surroundingTiles.append(t)
                }
            }
        }
        
        return surroundingTiles
    }
    
    func isChangeValid(forTile tile: Tile, surroundedBy: [Tile]) -> Bool {
        // Check surrounding tiles to see if rules are met
        // 1. A color tile can't be placed next to another color, unless it is next to both the other colors
        // TODO: Update this to actually work...
        return true
    }
    
    func selectTile(x: Int, y: Int) {
        // Pop next color and attempt to add color
        if let newState = popNextColor() {
            if let tile = tileAtPosition(x: x, y: y) {
                // Get surrounding tiles
                let tiles = getSurroundingTiles(forTile: tile)
                
                // Is change valid?
                let validChange = isChangeValid(forTile: tile, surroundedBy: tiles)
                if (validChange) {
                    NotificationCenter.default.post(name: TileSelectedSuccessNotification, object: nil)
                    tile.state = newState
                } else {
                    NotificationCenter.default.post(name: TileSelectedFailedNotification, object: nil)
                    print("Gameover!")
                }
                gameHUDDelegate?.update()
            }
        }
    }
    
    func popNextColor() -> TileState? {
        if _nextColors.count > 0 {
            return _nextColors.removeFirst()
        } else {
            return nil
        }
    }
    
    /// Parse level-[num].txt, and create tile entities with respective positions
    func buildGrid(forLevel level: String) {
        var lines: [String]!
        if let path = Bundle.main.path(forResource: level, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                lines = data.components(separatedBy: .newlines)
            } catch {
                print(error)
            }
        }
        
        // Save the size of the grid
        _gridsize = Int(lines[0])!
        
        // Create the tiles
        var y = 0
        
        // Iterate over list in reverse to account for 0,0 being in lower left
        for i in 1..._gridsize {
            var x = 0
            let node = lines[(_gridsize+1)-i].components(separatedBy: ",")
            for element in node {
                if element == "1" {
                    print("Creating new tile at:(\(x), \(y))")
                    let tile = Tile(state: TileState.Empty, x: x, y: y)
                    _tiles.append(tile)
                }
                x += 1
            }
            y += 1
        }
        
        // Parse list of nextColors
        let numberOfTiles = Int(lines[_gridsize + 1])!
        for i in (_gridsize + 2)..<(_gridsize + 2 + numberOfTiles) {
            let color = TileState(rawValue: Int(lines[i])!)!
            _nextColors.append(color)
        }
    }
}
