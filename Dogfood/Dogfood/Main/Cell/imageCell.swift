//
//  imageCell.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

class imageCell: UICollectionViewCell {

    @IBOutlet weak var profile: UIImageView!
    
    override func awakeFromNib() {
        self.profile.layer.cornerRadius = 20
    }

}
