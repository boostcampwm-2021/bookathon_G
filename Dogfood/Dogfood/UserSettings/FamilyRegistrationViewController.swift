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
        self.setNavigationController()
        self.familyNameTextField.setViewSettings(width: 10)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.familyNameTextField.resignFirstResponder()
    }
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "가족 이름을 등록해주세요"
        
        let barButtonItem = UIBarButtonItem(title: "가족 등록", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = .lightGray
        
        self.navigationItem.backBarButtonItem = barButtonItem
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        // 가족 이름 firebase로 전송
        
        guard let familyName = self.familyNameTextField.text else {
            return
        }
        UserDefaults.standard.set(familyName, forKey: "familyCode")
        
        Collection.familyCollection.document(familyName).setData([
            "Dogs": [],
            "members": []
                                                      ])
        
        
        let DogRegistrationViewController = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "DogRegistrationViewController")
        
        self.navigationController?.pushViewController(DogRegistrationViewController, animated: true)
    }
    
}

extension FamilyRegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.familyNameTextField.resignFirstResponder()
        return true
    }
    
}
