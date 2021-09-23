//
//  MainViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

protocol mainViewDelegate:AnyObject {
    func addFeedData(time:Date ,image:String ,color:UIColor)
}

class MainViewController: UIViewController {
    
    //MARK: - Properties
    let CellId = "imageCell"
    let feedId = "feedCell"
    var feedLogs:[DogLog] = []
    var members:[User] = []
    var userIdx:String {
        let idx = UserDefaults.standard.integer(forKey: "userIdx") ?? 1
        return String(1)
    }
    var user:User?
    var dogname:String = ""
    var dogImg: String = ""
    
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
