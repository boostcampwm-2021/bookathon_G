//
//  yourChatCell.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/24.
//

import UIKit

class yourChatCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var userImage: UIImageView!
    
    var chat:Chat? {
        didSet {
            userName.text = chat!.userName
            content.text = chat!.content
            userImage.image = UserInfo(rawValue: chat!.imgStr)?.image            
        }
    }
    
    override func awakeFromNib() {
        self.content.roundCorners(cornerRadius: 8, maskedCorners: [.layerMaxXMinYCorner ,.layerMaxXMaxYCorner ,
                                                                    .layerMinXMinYCorner ])
    }
    
}
