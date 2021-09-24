//
//  SelectViewController.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import UIKit



class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationController()
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.setNavigationController()
//    }
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "어떤 사용자세요?"
        
        let barButtonItem = UIBarButtonItem(title: "선택화면", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = .lightGray
        
        self.navigationItem.backBarButtonItem = barButtonItem
    }
    
    @IBAction func invitationCodeButtonTouched(_ sender: Any) {
        let InvitationViewController = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "InvitationViewController")
        
        self.navigationController?.pushViewController(InvitationViewController, animated: true)
    }
    
    @IBAction func familyRegistrationButtonTouched(_ sender: Any) {
        let FamilyRegistrationViewController = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "FamilyRegistrationViewController")
        
        self.navigationController?.pushViewController(FamilyRegistrationViewController, animated: true)
    }
}
