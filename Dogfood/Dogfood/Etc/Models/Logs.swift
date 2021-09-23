//
//  Logs.swift
//  Dogfood
//
//  Created by 윤상진 on 2021/09/23.
//

import Foundation

class Logs {
    typealias log = (String, Date)
    typealias Listner = () -> Void
    private var listner: Listner
    var datas: [log] {
        didSet {
            listner()
        }
    }
    
    init(listner: @escaping Listner) {
        datas = []
        self.listner = listner
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
