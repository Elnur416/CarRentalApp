//
//  HomeController.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var collection1: UICollectionView!
    @IBOutlet weak var collection2: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection1.dataSource = self
        collection1.delegate = self
        collection2.dataSource = self
        collection2.delegate = self
        collection1.register(UINib(nibName: "Collection1Cell", bundle: nil), forCellWithReuseIdentifier: "Collection1Cell")
        collection2.register(UINib(nibName: "Collection2Cell", bundle: nil), forCellWithReuseIdentifier: "Collection2Cell")
        configureLayout1()
        configureLayout2()
    }
    func configureLayout1() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        collection1.collectionViewLayout = layout
    }

    func configureLayout2() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 20, right: 40)
        collection2.collectionViewLayout = layout
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collection1 {
            10
        } else {
            10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collection1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection1Cell", for: indexPath) as! Collection1Cell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection2Cell", for: indexPath) as! Collection2Cell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collection1 {
            .init(width: collectionView.frame.width / 3, height: 150)
        } else {
            .init(width: collectionView.frame.width / 1 - 80, height: 400)
        }
    }
}


