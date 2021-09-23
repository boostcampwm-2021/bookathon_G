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
        
        self.familyNameTextField.addLeftView(width: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationController()
    }
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "가족 이름을 등록해주세요"
        self.navigationController?.navigationBar.backItem?.title = "가족 등록"
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
