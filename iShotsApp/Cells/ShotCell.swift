//
//  ShotCell.swift
//  iShotsApp
//
//  Created by Steven Shatz on 4/8/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

import Foundation
import UIKit

class ShotCell : UICollectionViewCell {
    
    @IBOutlet var coverImageView : UIImageView!
    @IBOutlet var nameLabel : UILabel!  // name of the artist
    @IBOutlet var titleLabel : UILabel! // title of the image
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.textColor = UIColor(white: 0.45, alpha: 1.0)
        nameLabel.font = UIFont(name: Theme.fontName, size: 11)
        
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont(name: Theme.fontName, size: 14)
        
        coverImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        coverImageView.layer.borderWidth = 0.5
    }
    
    
}
