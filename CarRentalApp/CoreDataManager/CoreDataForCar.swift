//
//  CoreDataManager.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 22.12.24.
//

import Foundation
import UIKit
import CoreData

class CoreDataForCar {
    var context = AppDelegate().persistentContainer.viewContext
    
    init (context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchData(completion: (([CarList]) -> Void)) {
        do {
            let data = try context.fetch(CarList.fetchRequest())
            completion(data)
//            collection.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(carModel: CarModel) {
        let model = CarList(context: context)
        model.name = carModel.name
        model.image = carModel.image
        model.price = carModel.price
        model.engine = carModel.engine
        model.brand = carModel.engine
        model.category = carModel.category?.name
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
