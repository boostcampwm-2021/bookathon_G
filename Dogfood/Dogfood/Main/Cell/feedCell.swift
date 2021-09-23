//
//  feedCell.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit



class feedCell: UICollectionViewCell {

    @IBOutlet weak var food: UIImageView!
    @IBOutlet weak var time: UILabel!
    
    var log:Log? {
        didSet {
            let foodImgStr = log!.foodImgStr 
            self.food.image = UIImage(named: foodImgStr)
            self.food.layer.cornerRadius = 55
            self.time.text = log?.time.text
            if foodImgStr == "" || foodImgStr == "plus" || foodImgStr == "more" {
                self.time.text = ""
            }
            self.food.backgroundColor = FoodInfo(rawValue: log!.foodImgStr)?.color ?? .systemGray
        }
    }        

}
