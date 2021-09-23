//
//  PopupViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

class PopupViewController: UIViewController {
    
    //MARK: - Properties
    let cellId = "foodCell"
    let imgs:[String] = ["food1","food2","food3",
                         "food4","food5","food6"]
    let colors:[UIColor] = [.systemTeal , .systemPink , .systemGray,
                            .systemFill , .systemCyan , .systemGray2]
    
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? foodCell else { return UICollectionViewCell() }
        
        let idx = indexPath.item + indexPath.section*3
        cell.food = Food(image: imgs[idx], color: colors[idx])
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let len =  self.innerView.frame.size.width / 3
        return CGSize(width:len, height: len)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
        
    }
    
  
}
