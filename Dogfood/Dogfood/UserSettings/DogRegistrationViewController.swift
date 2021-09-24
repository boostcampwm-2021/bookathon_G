//
//  DogRegistrationViewController.swift
//  Dogfood
//
//  Created by 최완식 on 2021/09/23.
//

import UIKit
import FirebaseStorage

class DogRegistrationViewController: UIViewController {

    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    let storage = Storage.storage()
    private var dogImage: UIImage = UIImage(imageLiteralResourceName: "dogDefault")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationController()
        self.dogNameTextField.setViewSettings(width: 10)
        self.dogImageView.makeCircle()
        self.nextButton.setViewSettings()
    }
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "강아지를 등록하세요"
        
        let barButtonItem = UIBarButtonItem(title: "강아지 등록", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = .lightGray
        
        self.navigationItem.backBarButtonItem = barButtonItem
    }
    
    private func uploadimage(img :UIImage, name: String){
        var data = Data()
        data = img.jpegData(compressionQuality: 0.8)!
        let filePath = name
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storage.reference().child(filePath).putData(data,metadata: metaData){
            (metaData,error) in if let error = error{
                print(error.localizedDescription)
                return
            } else {
                print("성공")
                }
        }
    }


    
    @IBAction func dogImageViewTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        // 강아지 정보 firebase로
        
        guard let dogName = self.dogNameTextField.text,
              let familyName = UserDefaults.standard.value(forKey: "familyCode") as? String else {
            return
        }

        self.uploadimage(img: dogImage, name: dogName)
        
        var users = [Any]()

        let dog: [String: Any] = [
            "imgUrl": "gs://dogfood-7f23c.appspot.com/\(dogName)",
            "name": dogName,
            "Logs": []
        ]

        Collection.familyCollection.document(familyName).getDocument { (document, error) in
            if let data = document?.data() {
                users = data["members"] as! [Any]
            } else {
                print("Document does not exist")
            }
        }

        Collection.familyCollection.document(familyName).setData([
            "members": users,
            "Dogs": [dog]
                                                      ])
        
            
        let UserRegistraionViewController = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "UserRegistraionViewController")
        
        self.navigationController?.pushViewController(UserRegistraionViewController, animated: true)
    }
}

// Mark - Text Input 처리

extension DogRegistrationViewController: UITextFieldDelegate {
    
    private func checkButtonEnabled() {
        guard let text = self.dogNameTextField.text else { return }
        
        self.nextButton.isEnabled = text.isNotEmpty()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dogNameTextField.resignFirstResponder()
        self.checkButtonEnabled()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.dogNameTextField.resignFirstResponder()
        self.checkButtonEnabled()
        
        return true
    }

    @IBAction func nameTextFieldChanged(_ sender: Any) {
        self.checkButtonEnabled()
    }
}




extension DogRegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            self.dogImageView.image = image
            self.dogImage = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
