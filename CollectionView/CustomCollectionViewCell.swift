//
//  CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by Eric Dolecki on 8/5/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
    }
}
