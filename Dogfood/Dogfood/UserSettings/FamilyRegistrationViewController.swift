//
//  FamilyRegistrationViewController.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import UIKit

class FamilyRegistrationViewController: UIViewController {

    @IBOutlet weak var familyNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.familyNameTextField.frame.height))
        
        self.familyNameTextField.leftView = paddingView
        self.familyNameTextField.leftViewMode = .always
    }

}

extension FamilyRegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.familyNameTextField.resignFirstResponder()
        return true
    }
}
