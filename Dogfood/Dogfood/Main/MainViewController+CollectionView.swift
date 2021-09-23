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
            
            cell.image =  UIImage(named: "dog") ?? UIImage()
            
            return cell
        }
        
        if collectionView == feedCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedId, for: indexPath) as! feedCell
            
            if indexPath.section == 0 && indexPath.item == 0 {
                cell.feed = Feed(image: "plus", time: nil)
                return cell
            }
            
            if indexPath.section == 1 && indexPath.item == 2 {
                cell.feed = Feed(image: "more", time: nil)
                return cell
            }
            
            let idx = indexPath.item + indexPath.section*3 - 1
            
            cell.feed = idx >= feedLogs.count ? Feed(image: "", time: nil) : feedLogs[idx]
                                                
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    //size for item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == familyCollectionView {
            
            return CGSize(width: 50, height: 50)
            
        }
        
        if collectionView == feedCollectionView {

            return CGSize(width: 110, height: 140)

        }
        
        return .zero
        
    }
    
    //inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView == familyCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        if collectionView == feedCollectionView {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        
        return .zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == feedCollectionView {
            if indexPath.section == 0 && indexPath.item == 0 {
                
                let vc = UIStoryboard(name: "Popup", bundle: nil).instantiateViewController(withIdentifier: "popup") as! PopupViewController
                
                vc.delegate = self
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                
                self.present(vc, animated: true, completion: nil)
            }
            
            if indexPath.section == 1 && indexPath.item == 2 {
                
                let vc = UIStoryboard(name: "Etc", bundle: nil).instantiateViewController(withIdentifier: "etc") as! EtcTableViewController
                vc.documentId = "1"
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    }
}
