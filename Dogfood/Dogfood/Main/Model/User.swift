//
//  User.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import Foundation
import UIKit

enum UserInfo:String {
    case person1 , person2 , person3, person4, person5, person6
    
    var image:UIImage {
        switch self {
        case .person1:
            return "👩‍🦰".image()!
        case .person2:
            return "👱‍♂️".image()!
        case .person3:
            return "👱‍♀️".image()!
        case .person4:
            return "👨‍🦳".image()!
        case .person5:
            return "👨‍🦰".image()!
        case .person6:
            return "👩‍🦱".image()!
        }
    }
}
