//
//  feedCell.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit



class feedCell: UICollectionViewCell {

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var time: UILabel!
    
    var feed:Feed? {
        didSet {
            self.profile.image = UIImage(named:  feed!.image)
            self.profile.layer.cornerRadius = 55
            self.time.text =  feed!.time == nil ? "" : feed?.time!.text
            self.profile.backgroundColor = .systemGray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
