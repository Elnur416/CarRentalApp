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
        viewModel.getCategoryData()
        searchConfigure()
    }
    
    @IBAction func searchHandler(_ sender: UITextField) {
        viewModel.isSearchActive = true
        if let searchText = sender.text, !searchText.isEmpty {
            viewModel.searchedCar = viewModel.cars.filter({ $0.brand?.lowercased().contains(searchText.lowercased()) ?? false})
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

//MARK: - DataSource and Delegate
extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.isSearchActive {
            viewModel.searchedCar.count
        } else {
            if viewModel.selectedCategory == nil {
                viewModel.cars.count
            } else {
                viewModel.carsForCategory.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection2Cell", for: indexPath) as! Collection2Cell
        if viewModel.isSearchActive {
            cell.configure(data: viewModel.searchedCar[indexPath.row])
        } else {
            if viewModel.selectedCategory == nil {
                cell.configure(data: viewModel.cars[indexPath.row])
            } else {
                cell.configure(data: viewModel.carsForCategory[indexPath.row])
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 1 - 80, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        header.configure(categories: viewModel.category)
        header.onCategory = { selectedCategory in
            self.viewModel.selectedCategory = selectedCategory
            self.viewModel.getCarDataForCategory(category: self.viewModel.selectedCategory!)
            self.collection.reloadData()
            
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: view.frame.size.width, height: 200)
    }
}
