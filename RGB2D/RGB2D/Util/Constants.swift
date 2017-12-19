//
//  Constants.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/13/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import Foundation
import UIKit

enum TileState: Int {
    case Empty = 0
    case Red = 1
    case Green = 2
    case Blue = 3
}

func colorForTileState(state: TileState) -> UIColor {
    switch state {
    case .Empty:
        return UIColor(rgb: 0x9B9B9B)
    case .Red:
        return UIColor(rgb: 0xE03900)
    case .Green:
        return UIColor(rgb: 0x4D8E27)
    case .Blue:
        return UIColor(rgb: 0x176B86)
    }
}

// MARK: Notifications
let TileSelectedSuccessNotification = NSNotification.Name("TileSelectedSuccess")
let TileSelectedFailedNotification = NSNotification.Name("TileSelectedFailed")

