//
//  HeaderView.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 24.12.24.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = HomeViewModel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "Collection1Cell", bundle: nil), forCellWithReuseIdentifier: "Collection1Cell")
        backgroundColor = .secondarySystemBackground
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collection.collectionViewLayout = layout
        
        viewModel.getCategoryData()
    }
    
}

extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection1Cell", for: indexPath) as! Collection1Cell
        cell.configure(image: viewModel.category[indexPath.row].image ?? "",
                       name: viewModel.category[indexPath.row].name ?? "",
                       size: viewModel.category[indexPath.row].size ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.size.width / 3, height: 150)
    }
}
