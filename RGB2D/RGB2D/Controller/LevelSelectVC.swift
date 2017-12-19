//
//  LevelSelectVC.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/17/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import UIKit

class LevelSelectVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //Define Layout here
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = collectionView.bounds.width - 60
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width / 4, height: width / 4)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20

        collectionView.collectionViewLayout = layout
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension LevelSelectVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as? LevelCell else { return UICollectionViewCell() }
        
        cell.configureCell(level: indexPath.row + 1)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "GameVC") as! GameVC
        gameVC.selectedLevel = "level-\(indexPath.row+1)"
        present(gameVC, animated: true, completion: nil)
    }
}
