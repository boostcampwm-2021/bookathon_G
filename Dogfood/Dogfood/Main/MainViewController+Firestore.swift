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
        
        self.snapshot = Collection.familyCollection.document(familyCode).addSnapshotListener { Snapshot, error in
            self.feedLogs = []
            self.members = []
            
            
            //가족들 정보 넣기
            let members = Snapshot?.get("members") as? [[String:String]]
            members?.forEach({ info in
                let img = info["imgStr"] ?? ""
                let name = info["name"] ?? "user"
                self.members.append(User(imgStr: img, name: name))
            })
                        
            //로그 정보 넣기
            self.dog = (Snapshot?.get("Dogs") as? [[String:Any]] ?? []).first!
            self.dogImg = self.dog["imgUrl"] as? String ?? ""
            self.dogName.text = self.dog["name"] as? String ?? ""
                        
            let logs = self.dog["Logs"] as? [[String:Any]] ?? []
            logs.forEach { log in
                let foodimg = log["foodImgStr"] as? String ?? "food1"
                let imgStr = log["imgStr"] as? String ?? "person1"
                let time = log["time"] as? Timestamp
                self.feedLogs.append(Log(foodImgStr: foodimg, imgStr: imgStr, time: time?.dateValue() ?? Date() ))
            }
            
            self.familyCollectionView.reloadData()
            self.feedCollectionView.reloadData()
        }
    
        
    }
    
    
}
