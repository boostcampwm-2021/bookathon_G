//
//  MainViewController+CollectionView.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

extension MainViewController: UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    
    //section number
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == familyCollectionView {
        
            return 1
            
        }
        
        if collectionView == feedCollectionView {

            return 2

        }

        return 0
    }
    
    //row number
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == familyCollectionView {
        
            return 5
            
        }
        
        if collectionView == feedCollectionView {
            
            return 3
            
        }
        
        return 0
    }
    
    //reuse Cell func
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == familyCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! imageCell
            cell.profile.image = UIImage(named: "dog") ?? UIImage()
            
            return cell
        }
        
        if collectionView == feedCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedId, for: indexPath) as! feedCell
            cell.profile.image = UIImage(named: "dog")!
            cell.time.text = "8:00"
            cell.time.textColor = .blue
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == familyCollectionView {
            
            return CGSize(width: 50, height: 50)
            
        }
        
        if collectionView == feedCollectionView {

            return CGSize(width: 100, height: 140)

        }
        
        return .zero
        
    }
    
    
}
