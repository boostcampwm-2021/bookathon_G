//
//  imageCell.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

class imageCell: UICollectionViewCell {
    
    var image:UIImage? {
        didSet{
            self.profile.image = image
            self.profile.layer.cornerRadius = 20
        }
    }

    @IBOutlet weak var profile: UIImageView!
    
    override func awakeFromNib() {
        
    }

}
