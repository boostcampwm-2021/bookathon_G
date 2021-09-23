//
//  Date+Extension.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import Foundation

extension Date {
    var text: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
}
