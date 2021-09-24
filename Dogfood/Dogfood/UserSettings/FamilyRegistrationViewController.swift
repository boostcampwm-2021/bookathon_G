//
//  FamilyRegistrationViewController.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import UIKit

class FamilyRegistrationViewController: UIViewController {

    @IBOutlet weak var familyNameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationController()
        self.familyNameTextField.setViewSettings(width: 10)
        self.nextButton.setViewSettings()
    }
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "가족 이름을 등록해주세요"
        
        let barButtonItem = UIBarButtonItem(title: "가족 등록", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = .lightGray
        
        self.navigationItem.backBarButtonItem = barButtonItem
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "에러", message: "이미 있는 가족 이름입니다.", preferredStyle: .alert)
        
        let check = UIAlertAction(title: "확인", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(check)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        // 가족 이름 firebase로 전송
        
        guard let familyName = self.familyNameTextField.text else {
            return
        }
        
        Collection.familyCollection.document(familyName).getDocument { (document, error) in
            if document?.data() == nil {
                UserDefaults.standard.set(familyName, forKey: "familyCode")
                
                Collection.familyCollection.document(familyName).setData([
                    "Dogs": [],
                    "members": []
                                                              ])
                
                let DogRegistrationViewController = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "DogRegistrationViewController")
                
                self.navigationController?.pushViewController(DogRegistrationViewController, animated: true)
            } else {
                // alert 띄우기
                self.showAlert()
            }
        }
    }
    
}


// Mark - Text Input 처리

extension FamilyRegistrationViewController: UITextFieldDelegate {
    
    private func checkButtonEnabled() {
        guard let text = self.familyNameTextField.text else { return }
        
        self.nextButton.isEnabled = text.isNotEmpty()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.familyNameTextField.resignFirstResponder()
        self.checkButtonEnabled()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.familyNameTextField.resignFirstResponder()
        self.checkButtonEnabled()
        
        return true
    }

    @IBAction func nameTextFieldChanged(_ sender: Any) {
        self.checkButtonEnabled()
    }
}

