//
//  SwiftExtension.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import Foundation
import UIKit

extension UIView {
    
    func makeCircle() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

extension UITextField {
    
    func setViewSettings(width: Double) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
    
    
    
}


extension UINavigationController {

  public func pushViewController(_ viewController: UIViewController,
                                 animated: Bool,
                                 completion: (() -> Void)?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    pushViewController(viewController, animated: animated)
    CATransaction.commit()
  }

}
