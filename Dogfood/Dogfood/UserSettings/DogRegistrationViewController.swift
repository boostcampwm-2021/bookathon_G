//
//  DogRegistrationViewController.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import UIKit

class DogRegistrationViewController: UIViewController {

    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.dogImageView.layer.cornerRadius = self.dogImageView.frame.height / 2
        self.dogImageView.layer.borderWidth = 1
        self.dogImageView.layer.borderColor = UIColor.gray.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.dogNameTextField.frame.height))
        
        self.dogNameTextField.leftView = paddingView
        self.dogNameTextField.leftViewMode = .always
    }
    
    @IBAction func dogImageViewTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
}

extension DogRegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.dogNameTextField.resignFirstResponder()
        return true
    }
}


extension DogRegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            self.dogImageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
