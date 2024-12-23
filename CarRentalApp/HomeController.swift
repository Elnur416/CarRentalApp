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
    
    let viewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        configureSearch()
        configureLayout1()
        configureLayout2()
        viewModel.getCarData()
        viewModel.getCategoryData()
    }
    
    func configureSearch() {
        search.layer.cornerRadius = 30
        search.layer.frame.size.height = 60
        search.layer.masksToBounds = true
    }
    
    func configureLayout1() {
        collection1.dataSource = self
        collection1.delegate = self
        collection1.register(UINib(nibName: "Collection1Cell", bundle: nil), forCellWithReuseIdentifier: "Collection1Cell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        collection1.collectionViewLayout = layout
    }
    
    func configureLayout2() {
        collection2.dataSource = self
        collection2.delegate = self
        collection2.register(UINib(nibName: "Collection2Cell", bundle: nil), forCellWithReuseIdentifier: "Collection2Cell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 20, right: 40)
        collection2.collectionViewLayout = layout
    }
    
    func loadData() {
        if viewModel.manager.getBool(key: .isDataLoaded) {
            return
        } else {
            viewModel.loadData()
        }
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collection1 {
            viewModel.category.count
        } else {
            viewModel.cars.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collection1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection1Cell", for: indexPath) as! Collection1Cell
            cell.configure(image: viewModel.category[indexPath.row].image ?? "",
                           name: viewModel.category[indexPath.row].name ?? "",
                           size: viewModel.category[indexPath.row].size ?? "")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection2Cell", for: indexPath) as! Collection2Cell
            cell.configure(brand: viewModel.cars[indexPath.row].brand ?? "",
                           model: viewModel.cars[indexPath.row].name ?? "",
                           carPrice: viewModel.cars[indexPath.row].price ?? "",
                           engine: viewModel.cars[indexPath.row].engine ?? "",
                           image: viewModel.cars[indexPath.row].image ?? "")
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


