//
//  MainViewController+Extension.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//



import Foundation
import UIKit
import FirebaseFirestore

extension MainViewController :mainViewDelegate {
    
    func addFeedData(time: Date, image: String) {
        
        self.feedLogs.append(Log(foodImgStr: image, imgStr: "", time: time))
        
        let log:[String:Any] = [
            "foodImgStr" : image,
            "imgStr": userImage,
            "time" : Timestamp(date: time)
        ]
        
        var logs = self.dog["Logs"] as? [[String:Any]] ?? []
        logs.append(log)
        self.dog["Logs"] = logs
        
        Collection.familyCollection.document(familyCode).updateData([
            "Dogs" : [self.dog]
        ]) { error in
        }
        
        self.feedCollectionView.reloadData()
        
    }
        
}
