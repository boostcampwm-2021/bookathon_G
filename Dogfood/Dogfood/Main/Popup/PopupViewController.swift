//
//  PopupViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

class PopupViewController: UIViewController {
    
    //MARK: - Properties
    let cellId = "imageCell"
    let imgs:[String] = ["dog","dog","dog",
                         "dog","dog","dog"]

    //MARK: - IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSet()
    }
    
    
    //MARK: - Helpers
    
    func layoutSet() {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        self.backView.addGestureRecognizer(gesture)
        
        self.collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.innerView.layer.cornerRadius = 10
        self.collectionView.layer.cornerRadius = 10
        
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true) {
            
        }
    }

}


extension PopupViewController : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? imageCell else { return UICollectionViewCell() }
        
        cell.image = UIImage(named: imgs[indexPath.item])!
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        return CGSize(width: self.innerView.frame.size.width / 3, height: self.innerView.frame.size.height / 2)
        return CGSize(width: 50, height: 50)
        
    }
    
  
}
