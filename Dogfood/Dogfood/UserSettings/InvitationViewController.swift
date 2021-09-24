//
//  InvitationViewController.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import UIKit
import FirebaseFirestore

class InvitationViewController: UIViewController {

    @IBOutlet weak var invitationFamilyNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.invitationFamilyNameTextField.setViewSettings(width: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationController()
    }
    
    // Mark - helper functions
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "가족 이름를 입력해주세요"
        
        let barButtonItem = UIBarButtonItem(title: "가족 이름 입력", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = .lightGray
        
        self.navigationItem.backBarButtonItem = barButtonItem
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.invitationFamilyNameTextField.resignFirstResponder()
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        
        guard let familyName = self.invitationFamilyNameTextField.text else {
            return
        }
        
        Collection.familyCollection.document(familyName).getDocument { (document, error) in
            if document?.data() != nil {
                UserDefaults.standard.set(familyName, forKey: "familyCode")
                let UserRegistraionViewController = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "UserRegistraionViewController")
                
                self.navigationController?.pushViewController(UserRegistraionViewController, animated: true)
            } else {
                // alert 띄우기
            }
        }
//
//        Collection.familyCollection.document(familyName).setData([
//            "Dogs": [],
//            "members": []
//                                                      ])
//
//        UserDefaults.standard.set(familyName, forKey: "familyCode")
        
//        let UserRegistraionViewController = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "UserRegistraionViewController")
//
//        self.navigationController?.pushViewController(UserRegistraionViewController, animated: true)
    }
}


extension InvitationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.invitationFamilyNameTextField.resignFirstResponder()
        return true
    }
}
