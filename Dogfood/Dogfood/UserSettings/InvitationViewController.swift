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
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationController()
        self.invitationFamilyNameTextField.setViewSettings(width: 10)
    }
    
    
    
    // Mark - helper functions
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "가족 이름를 입력해주세요"
        
        let barButtonItem = UIBarButtonItem(title: "가족 이름 입력", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = .lightGray
        
        self.navigationItem.backBarButtonItem = barButtonItem
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "에러", message: "없는 가족 이름입니다.", preferredStyle: .alert)
        
        let check = UIAlertAction(title: "확인", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(check)
        
        self.present(alert, animated: true, completion: nil)
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
                self.showAlert()
            }
        }

    }
    
    
}

// Mark - Text Input 처리

extension InvitationViewController: UITextFieldDelegate {
    
    private func checkButtonEnabled() {
        guard let text = self.invitationFamilyNameTextField.text else { return }
        
        self.nextButton.isEnabled = text.isNotEmpty()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.invitationFamilyNameTextField.resignFirstResponder()
        self.checkButtonEnabled()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.invitationFamilyNameTextField.resignFirstResponder()
        self.checkButtonEnabled()
        
        return true
    }

    @IBAction func nameTextFieldChanged(_ sender: Any) {
        self.checkButtonEnabled()
    }
}
