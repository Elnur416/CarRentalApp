//
//  SearchViewModel.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 25.12.24.
//

import Foundation

class SearchViewModel {
    private let managerCar = CoreDataForCar(context: AppDelegate().persistentContainer.viewContext)
    var cars = [CarList]()
    let manager = UserDefaultsManager()
    var isSearchActive: Bool = false
    var searchedCar = [CarList]()
    private let carDatas = CarDatas()
    
    func getCarData() {
            managerCar.fetchData(completion: { data in
                self.cars = data
            })
    }
    
    func loadData() {
        carDatas.loadData()
        manager.setValue(value: true, key: .isDataLoaded)
    }
    
}
