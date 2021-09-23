//
//  UserRegistrationViewController.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import UIKit

class UserRegistrationViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    
    private var userImageString: String = "person1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNameTextField.addLeftView(width: 10)
        self.userImageView.makeCircle()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationController()
    }
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "사용자를 등록하세요"
        self.navigationController?.navigationBar.backItem?.title = "사용자 등록"
    }
    
    @IBAction func userImageViewTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "PersonPopup", bundle: nil).instantiateViewController(withIdentifier: "PersonPopupViewController") as! PersonPopupViewController
        
        vc.delegate = self
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func moveNext(_ sender: Any) {
        // userName userDefault 등록
        guard let userName = self.userNameTextField.text else {
            return
        }
        UserDefaults.standard.set(userName, forKey: "userName")
        

        guard let familyName = UserDefaults.standard.value(forKey: "familyCode") as? String else {
            return
        }
        
        var beforeUsers = [Any]()
        var dogs = [Any]()

        let user: [String: Any] = [
            "imgStr": self.userImageString,
            "name": userName
        ]

        Collection.familyCollection.document(familyName).getDocument { (document, error) in
            if let data = document?.data() {
                beforeUsers = data["members"] as? [Any] ?? [Any]()
                dogs = data["Dogs"] as? [Any] ?? [Any]()
                
                beforeUsers.append(user)
                
                Collection.familyCollection.document(familyName).setData([
                    "members": beforeUsers,
                    "Dogs": dogs,
                                                              ])
                
            } else {
                print("Document does not exist")
            }
        }
        
        let mainVC = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "main")
        self.view.window?.rootViewController = UINavigationController(rootViewController: mainVC)
    }
    
    
}

extension UserRegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.userNameTextField.resignFirstResponder()
        return true
    }
}

extension UserRegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.userImageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension UserRegistrationViewController :PersonPopupViewControllerDelegate {
    
    func addPersonData(image: String) {
        self.userImageString = image
        self.userImageView.image = UserInfo(rawValue: image)?.image
        UserDefaults.standard.set(image, forKey: Config.userImg)
    }
        
}
