//
//  MainViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    let CellId = "imageCell"
    let feedId = "feedCell"
    

    //MARK: - IBOutlets
    
    @IBOutlet weak var dogProfile: UIImageView!
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var familyCollectionView: UICollectionView!
    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    
    //MARK: -IBActions
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSet()
        layoutSet()
        collectionViewSet()
        
    }
    
    
    //MARK: - Helpers
    
    func navigationSet() {
        self.navigationItem.title = "만식이네"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func layoutSet() {
        self.dogProfile.layer.cornerRadius = 75
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
