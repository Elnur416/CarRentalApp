//
//  CoreDataForCategory.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 22.12.24.
//

import Foundation
import UIKit
import CoreData

class CoreDataForCategory {
    var context = AppDelegate().persistentContainer.viewContext
    
    init (context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchData(completion: (([CategoryList]) -> Void)) {
        do {
            let data = try context.fetch(CategoryList.fetchRequest())
            completion(data)
//            collection.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(categoryModel: CategoryModel) {
        let model = CategoryList(context: context)
        model.name = categoryModel.name
        model.image = categoryModel.image
        model.size = categoryModel.size
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
