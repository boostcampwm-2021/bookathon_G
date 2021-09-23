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
    
    let storage = Storage.storage()
    private var dogImage: UIImage = UIImage(imageLiteralResourceName: "dogDefault")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dogNameTextField.addLeftView(width: 10)
        self.dogImageView.makeCircle()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationController()
    }
    
    private func setNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "강아지를 등록하세요"
        self.navigationController?.navigationBar.backItem?.title = "강아지 등록"
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
        
        guard let dogName = self.dogNameTextField.text else {
            return
        }
        
        guard let familyName = UserDefaults.standard.value(forKey: "familyCode") as? String else {
            return
        }

        self.uploadimage(img: dogImage, name: dogName)
        
//        var beforeDogs = [Any]()
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

//        beforeDogs.append(dog)

        Collection.familyCollection.document(familyName).setData([
            "members": users,
            "Dogs": [dog]
                                                      ])
        
            
        let UserRegistraionViewController = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "UserRegistraionViewController")
        
        self.navigationController?.pushViewController(UserRegistraionViewController, animated: true)
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
            self.dogImage = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
