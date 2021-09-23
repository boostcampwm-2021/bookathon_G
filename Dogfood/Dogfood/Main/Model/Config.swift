//
//  collection.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import Foundation
import FirebaseFirestore


struct Config {
    
    static let users = "users"
    static let dogs = "Dogs"
    static let family = "family"
    
}

struct Collection {
    
    static let usersCollection: CollectionReference = {
        let db = Firestore.firestore()
        return db.collection(Config.users)
    }()
    
    static let dogsCollection : CollectionReference = {
        let db = Firestore.firestore()
        return db.collection(Config.dogs)
    }()
    
    static let familyCollection : CollectionReference = {
        let db = Firestore.firestore()
        return db.collection(Config.family)
    }()
}
