//
//  View+Extension.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/24.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
