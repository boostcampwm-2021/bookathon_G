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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        
    }
    
    func configureTimeEmoji() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
