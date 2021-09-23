//
//  InvitationViewController.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import UIKit

class InvitationViewController: UIViewController {

    @IBOutlet weak var invitationCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.invitationCodeTextField.frame.height))
        
        self.invitationCodeTextField.leftView = paddingView
        self.invitationCodeTextField.leftViewMode = .always
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.invitationCodeTextField.resignFirstResponder()
    }
    
}


extension InvitationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.invitationCodeTextField.resignFirstResponder()
        return true
    }
}
