//
//  ViewController.swift
//  MenuExam
//
//  Created by 1 on 23/10/2018.
//  Copyright © 2018 Sung hyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstViewTop: NSLayoutConstraint!
    @IBOutlet weak var firstViewHeight: NSLayoutConstraint!
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout = itemCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView else { return  HeaderView() }
        //        headerview.setView()
        headerview.setView(title: "최신순")
        return headerview
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return CollectionViewCell() }
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 30 , height: 314)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width - 30, height: section == 0 ? 0 : 32)
    }
}

extension ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = scrollView.contentOffset.y
        
        if y > 100 {
            print("y > 100")
            if firstViewTop.constant == 8 && firstViewHeight.constant == 32{
                print("8 & 32 -> 0")
                
                UIView.animate(withDuration: 0.8) {
                    self.firstViewTop.constant = 0
                    self.firstViewHeight.constant = 0
                    self.firstView.alpha = 0
                    self.navigationController?.navigationBar.alpha = 0
                    self.navigationController?.navigationBar.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
        }else{
            print("y < 100")
            
            if firstViewTop.constant == 0 && firstViewHeight.constant == 0{
                print("0 -> 8 & 32")
                
                UIView.animate(withDuration: 0.8) {
                    self.firstViewTop.constant = 8
                    self.firstViewHeight.constant = 32
                    self.firstView.alpha = 1
                    self.navigationController?.navigationBar.alpha = 1
                    self.navigationController?.navigationBar.isHidden = false
                    self.view.layoutIfNeeded()
                }
            }
        }
        
    }
}


