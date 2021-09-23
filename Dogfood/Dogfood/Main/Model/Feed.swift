//
//  File.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import Foundation
import UIKit

struct DogLog {
    let imgUrl:String
    let name:String
    let Logs:[Log]
}

struct Log {
    let foodImgStr:String
    let imgStr:String
    let time:Date
}

struct User {
    let imgStr:String
    let name:String
}

