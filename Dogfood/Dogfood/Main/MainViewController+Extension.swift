//
//  MainViewController+Extension.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//



import Foundation
import UIKit


extension MainViewController :mainViewDelegate {
    
    func addFeedData(time: Date, image: String, color: UIColor) {
        self.feedLogs.append(DogLog(imgUrl: "", name: "까미", Logs: []))
        self.feedCollectionView.reloadData()
        
    }
        
}
