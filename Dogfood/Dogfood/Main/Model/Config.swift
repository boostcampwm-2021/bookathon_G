//
//  collection.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import Foundation
import FirebaseFirestore
import UIKit


enum FoodInfo:String {
    case food1,food2,food3,food4,food5,food6,plus, more
    
    var color:UIColor {
        switch self {
        case .food1:
            return .systemCyan
        case .food2:
            return .systemFill
        case .food3:
            return .systemTeal
        case .food4:
            return .systemMint
        case .food5:
            return .systemPink
        case .food6:
            return .systemBrown
        case .plus:
            return .systemOrange
        case .more:
            return .systemGray4
        default:
            return .systemGray
        }
    }
    
    var name:String {
        switch self {
        case .food1:
            return "간식"
        case .food2:
            return "사료+간식"
        case .food3:
            return "알약"
        case .food4:
            return "물약"
        case .food5:
            return "사료"
        case .food6:
            return "우유"
        default:
            return ""
        }
    }
}

struct Config {
    
    static let chat = "chat"
    static let family = "family"
    static let userName = "userName"
    static let familyCode = "familyCode"
    static let userImg = "userImg"
    
}

struct Collection {
    
    static let familyCollection : CollectionReference = {
        let db = Firestore.firestore()
        return db.collection(Config.family)
    }()
    
    static let chatCollection : CollectionReference = {
        let db = Firestore.firestore()
        return db.collection(Config.chat)
    }()
}
