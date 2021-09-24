//
//  MainViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

protocol mainViewDelegate:AnyObject {
    func addFeedData(time:Date ,image:String )
}

class MainViewController: UIViewController {
    
    //MARK: - Properties
    let CellId = "imageCell"
    let feedId = "feedCell"
    var feedLogs:[Log] = []
    var members:[User] = []
    var user:User?
    let storage = Storage.storage()
    var dog:[String:Any] = [:]
    var dogname:String = ""
    var dogImg: String = ""
    var snapshot:ListenerRegistration?
    var userName:String {
        return UserDefaults.standard.string(forKey: "userName") ?? "user"
    }
    var familyCode:String {
        return UserDefaults.standard.string(forKey: "familyCode") ?? "abc"
    }
    var userImage:String {
        return UserDefaults.standard.string(forKey: "userImg") ?? "person1"
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var dogProfile: UIImageView!
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var familyCollectionView: UICollectionView!
    @IBOutlet weak var feedCollectionView: UICollectionView!
    @IBAction func chat(_ sender: Any) {
        let chatVC = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "chat")
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSet()
        layoutSet()
        collectionViewSet()
        addSnapshitListener()        
        
    }
    
    //MARK: - Helpers
    
    func navigationSet() {
        self.navigationItem.title = familyCode
        navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let barButtonItem = UIBarButtonItem(title: familyCode, style: .plain, target: self, action: nil)
        barButtonItem.tintColor = .lightGray
        
        self.navigationItem.backBarButtonItem = barButtonItem
    }
    
    func layoutSet() {
        self.dogProfile.layer.cornerRadius = 75
        self.dogProfile.image = UIImage(named: "dog")!
    }
    
    func collectionViewSet() {
        
        self.familyCollectionView.register(UINib(nibName: "imageCell", bundle: nil), forCellWithReuseIdentifier: CellId)
        self.feedCollectionView.register(UINib(nibName: "feedCell", bundle: nil), forCellWithReuseIdentifier: feedId)
        
        self.familyCollectionView.delegate = self
        self.familyCollectionView.dataSource = self
        
        self.feedCollectionView.delegate = self
        self.feedCollectionView.dataSource = self
        
    }

    func downloadimage(imgview:UIImageView){
        let url = dog["imgUrl"] as? String ?? ""
        storage.reference(forURL: url).downloadURL { (url, error) in
        let data = NSData(contentsOf: url!)
        let image = UIImage(data: data! as Data)
        imgview.image = image
    }
        
    }
}
