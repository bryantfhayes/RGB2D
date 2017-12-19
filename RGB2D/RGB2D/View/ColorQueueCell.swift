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
    
    func configure(color: UIColor) {
        colorView.backgroundColor = color
    }
}
