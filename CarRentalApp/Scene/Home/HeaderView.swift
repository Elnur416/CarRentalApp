//
//  HeaderView.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 24.12.24.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    @IBOutlet weak var collection: UICollectionView!
    
    let manager = UserDefaultsManager()
    var categories = [CategoryList]()
    var onCategory: ((String) -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "Collection1Cell", bundle: nil), forCellWithReuseIdentifier: "Collection1Cell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collection.collectionViewLayout = layout
    }
    
    func configure(categories: [CategoryList]) {
        self.categories = categories
    }
}

//MARK: - DataSource and Delegate
extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection1Cell", for: indexPath) as! HeaderCell
        cell.configure(category: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.size.width / 3, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for (index, _) in categories.enumerated() {
            categories[index].isSelected = index == indexPath.item ? true : false
        }
        collection.reloadData()
        
        let selectedCategory = categories[indexPath.row].name ?? ""
        onCategory?(selectedCategory)
    }
}
