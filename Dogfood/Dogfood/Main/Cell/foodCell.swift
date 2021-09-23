//
//  foodCell.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

struct Food {
    let image:String
    let color:UIColor
}

class foodCell: UICollectionViewCell {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var image: UIImageView!
    
    var food:Food? {
        didSet {
            self.image.image = UIImage(named: food!.image)!
            self.image.layer.cornerRadius = 33
            self.image.backgroundColor = food!.color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
