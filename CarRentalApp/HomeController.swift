//
//  HomeController.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var collection1: UICollectionView!
    @IBOutlet weak var collection2: UICollectionView!
 
    let viewModel = HomeViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        configureLayout1()
        configureLayout2()
        viewModel.getCarData()
        viewModel.getCategoryData()
        searchConfigure()
    }
    
    func searchConfigure() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
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
            if viewModel.isSearchActive {
                viewModel.searchedCar.count
            } else {
                viewModel.cars.count
            }
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
            if viewModel.isSearchActive {
                cell.configure(brand: viewModel.searchedCar[indexPath.row].category ?? "",
                               model: viewModel.searchedCar[indexPath.row].name ?? "",
                               carPrice: viewModel.searchedCar[indexPath.row].price ?? "",
                               engine: viewModel.searchedCar[indexPath.row].engine ?? "",
                               image: viewModel.searchedCar[indexPath.row].image ?? "")
            } else {
                cell.configure(brand: viewModel.cars[indexPath.row].category ?? "",
                               model: viewModel.cars[indexPath.row].name ?? "",
                               carPrice: viewModel.cars[indexPath.row].price ?? "",
                               engine: viewModel.cars[indexPath.row].engine ?? "",
                               image: viewModel.cars[indexPath.row].image ?? "")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collection1 {
            .init(width: collectionView.frame.width / 3, height: 150)
        } else {
            .init(width: collectionView.frame.width / 1 - 80, height: 380)
        }
    }
}

extension HomeController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.isSearchActive = false
        collection1.isHidden = false
        collection1.reloadData()
        collection2.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.isSearchActive = true
        collection1.isHidden = true
        if searchText.isEmpty {
            collection2.reloadData()
        } else {
            viewModel.searchedCar = viewModel.cars.filter({ $0.category?.contains(searchText) ?? false })
            collection2.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.isSearchActive = true
        collection1.isHidden = true
    }
}
