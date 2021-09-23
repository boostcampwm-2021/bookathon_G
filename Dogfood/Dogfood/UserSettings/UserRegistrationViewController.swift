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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.userImageView.layer.cornerRadius = self.userImageView.frame.height / 2
        self.userImageView.layer.borderWidth = 1
        self.userImageView.layer.borderColor = UIColor.gray.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.userNameTextField.frame.height))
        
        self.userNameTextField.leftView = paddingView
        self.userNameTextField.leftViewMode = .always
    }
    
    @IBAction func userImageViewTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Popup", bundle: nil).instantiateViewController(withIdentifier: "popup") as! PopupViewController
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func moveNext(_ sender: Any) {
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
