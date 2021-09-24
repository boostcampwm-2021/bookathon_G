//
//  chatViewController+Firestore.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/24.
//

import Foundation
import UIKit
import FirebaseFirestore

extension ChatViewController  {
    func addSnapshotListener() {
        
        Collection.chatCollection.document(familyCode).getDocument { Snapshot, error in
            if Snapshot?.exists == false {
                Collection.chatCollection.document(self.familyCode).setData([
                    "message" : []
                ])
            }
        }
        
        Collection.chatCollection.document(familyCode).addSnapshotListener { Snapshot, errer in
            self.message = []
            
            self.chats = Snapshot?.get("message") as? [[String:String]] ?? []
            
            self.chats.forEach { chat in
                let content = chat["content"] ?? ""
                let username = chat["userName"] ?? ""
                let userImg = chat["imgStr"] ?? ""
             
                self.message.append(Chat(imgStr: userImg, userName: username, content: content))
            }
            
            self.tableView.reloadData()
        }
        
    }
}
