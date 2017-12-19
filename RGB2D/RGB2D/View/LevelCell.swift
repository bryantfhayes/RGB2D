//
//  LevelCell.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/17/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import UIKit

class LevelCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet var stars: [UIImageView]!
        
    func configureCell(level: Int) {
        titleLbl.text = "Level \(level)"
    }
}
