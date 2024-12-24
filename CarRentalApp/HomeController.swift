//
//  HomeController.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    
 
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        configureLayout()
        viewModel.getCarData()
//        viewModel.getCategoryData()
        searchConfigure()
    }
    
    @IBAction func searchHandler(_ sender: UITextField) {
        viewModel.isSearchActive = true
        if let searchText = sender.text, !searchText.isEmpty {
            viewModel.searchedCar = viewModel.cars.filter({ $0.category?.lowercased().contains(searchText.lowercased()) ?? false})
            collection.reloadData()
        } else {
            viewModel.isSearchActive = false
            collection.reloadData()
        }
    }
    
    
    func searchConfigure() {
        searchTxt.borderStyle = .none
        searchTxt.layer.cornerRadius = 30
        searchTxt.backgroundColor = .white
        searchTxt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        searchTxt.leftViewMode = .always
        searchTxt.placeholder = "Search for a car"
        addRightIconToTextField(txtfield: searchTxt)
    }
    
    func addRightIconToTextField(txtfield: UITextField) {
        let rightIcon = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        rightIcon.tintColor = .lightGray
        rightIcon.image = UIImage(systemName: "magnifyingglass")
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rightView.addSubview(rightIcon)
        searchTxt.rightViewMode = .always
        searchTxt.rightView = rightView
    }
    
    func configureLayout() {
        title = "Car Rental"
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "Collection2Cell", bundle: nil),
                            forCellWithReuseIdentifier: "Collection2Cell")
//        collection.register(HeaderCollectionView.self,
//                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                            withReuseIdentifier: HeaderCollectionView.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        collection.collectionViewLayout = layout
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
        if viewModel.isSearchActive {
            viewModel.searchedCar.count
        } else {
            viewModel.cars.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            .init(width: collectionView.frame.width / 1 - 80, height: 350)
        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: view.frame.size.width, height: 200)
    }
}
