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
        self.invitationFamilyNameTextField.addLeftView(width: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationController()
    }
    
    // Mark - helper functions
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "가족 이름를 입력해주세요"
        self.navigationController?.navigationBar.backItem?.title = "가족 이름 입력"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.invitationFamilyNameTextField.resignFirstResponder()
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        // 초대코드 userDefault
        
        guard let familyName = self.invitationFamilyNameTextField.text else {
            return
        }
        
        Collection.familyCollection.document(familyName).getDocument { (document, error) in
            print(document?.data())
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
