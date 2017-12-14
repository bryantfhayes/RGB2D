//
//  ColorQueueCell.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/13/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import UIKit

class ColorQueueCell: UITableViewCell {
    
    @IBOutlet weak var colorView: UIView!
    
    func configure() {
        // TODO: Randomly chooses color for now, remove this.
        let possibleColors = [Color.Red, Color.Green, Color.Blue]
        let roll = Int(arc4random_uniform(UInt32(possibleColors.count)))
        colorView.backgroundColor = UIColor.init(rgb: possibleColors[roll].rawValue)
    }
}
