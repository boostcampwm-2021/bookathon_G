//
//  EtcTableViewCell.swift
//  Dogfood
//
//  Created by 윤상진 on 2021/09/23.
//

import UIKit

class EtcTableViewCell: UITableViewCell, UINavigationControllerDelegate {

    @IBOutlet var detailEmoji: UILabel!
    @IBOutlet var timeEmoji: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        userImageView.layer.cornerRadius = 30
        super.awakeFromNib()
    }
}
