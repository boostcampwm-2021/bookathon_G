//
//  MainViewController+Firestore.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import Foundation
import UIKit
import FirebaseFirestore

extension MainViewController {
    func addSnapshitListener() {
        
//        Collection.usersCollection.document(userIdx).addSnapshotListener { Snapshot, error in
//            let familyCode = Snapshot?.get("family_code") as? String ?? "abc"
//            let img = Snapshot?.get("img") as? String ?? ""
//            let name = Snapshot?.get("name") as? String ?? "user"
//
//            self.user = User(familyCode: familyCode, img: img, name: name)
//            if error != nil {
//                print(error)
//            }
//        }
        
        let familyCode = "abc"
        var dog:Int = 1
        
        Collection.familyCollection.document(familyCode).addSnapshotListener { Snapshot, error in
            let members = Snapshot?.get("members") as? [[String:Any]]
            //가족들 정보 넣기
            members?.forEach({ info in
                let img = info["image"] as? String ?? ""
                let name = info["name"] as? String ?? "user"
                self.members.append(User(familyCode: familyCode, img: img, name: name))
            })
            
            dog = (Snapshot?.get("Dogs") as? [Int] ?? []).first ?? 1
            
        }
        
        Collection.dogsCollection.document(String(dog)).addSnapshotListener { Snapshot, error in
            
            self.dogname = Snapshot?.get("name") as? String ?? "dog"
            self.dogImg =  Snapshot?.get("img") as? String ?? "dog"
            let logs = Snapshot?.get("Logs") as? [[String:Any]] ?? []
            
            logs.forEach { log in
                let img = log["icon"] as? String ?? "food1"
                let time = log["time"] as? Timestamp
                self.feedLogs.append(Feed(image: img, time: time?.dateValue(), color: .systemGray))
            }
            
            self.feedCollectionView.reloadData()
        }
    }
    
    
}
