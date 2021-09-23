//
//  Logs.swift
//  Dogfood
//
//  Created by 윤상진 on 2021/09/23.
//

import Foundation

class Logs {
    typealias log = (String, Date)
    var datas: [log]
    
    init() {
        datas = [("\u{1F474}", Date(timeIntervalSinceNow: 1)), ("\u{1F475}", Date(timeIntervalSinceNow: 2))]
    }
    
    init(datas: [log]) {
        self.datas = datas
    }
}

extension Logs {
    var count: Int {
        return datas.count
    }
    
    subscript(_ int: Int) -> log {
        return datas[int]
    }
}
