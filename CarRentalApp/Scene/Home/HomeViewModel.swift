//
//  HomeViewModel.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 22.12.24.
//

import Foundation
import UIKit

class HomeViewModel {
    private let managerCar = CoreDataForCar(context: AppDelegate().persistentContainer.viewContext)
    private let managerCategory = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
    var category = [CategoryList]()
    var cars = [CarList]()
    private let carDatas = CarDatas()
    let manager = UserDefaultsManager()
    var isSearchActive: Bool = false
    var searchedCar = [CarList]()
    var carsForCategory = [CarList]()
    var selectedCategory: String?
    
    func getCategoryData() {
            managerCategory.fetchData(completion: { data in
                self.category = data
            })
    }
    
    func getCarData() {
            managerCar.fetchData(completion: { data in
                self.cars = data
            })
    }
    
    func getCarDataForCategory(category: String) {
            carsForCategory = cars.filter({ $0.category?.contains(selectedCategory ?? "") ?? false})
    }
    
    func loadData() {
        carDatas.loadData()
        manager.setValue(value: true, key: .isDataLoaded)
    }
}

