//
//  MainViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit
import FirebaseFirestore

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
        self.navigationItem.title = "만식이네"
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
    
    override func viewDidAppear(_ animated: Bool) {
        print(feedCollectionView.numberOfSections)
    }

}
