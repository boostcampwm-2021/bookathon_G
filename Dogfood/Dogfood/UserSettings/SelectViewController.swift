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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationController()
    }
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "어떤 사용자세요?"
        self.navigationController?.navigationBar.backItem?.title = "선택화면"
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
