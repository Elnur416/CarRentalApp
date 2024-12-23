//
//  CarList+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 22.12.24.
//
//

import Foundation
import CoreData


extension CarList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarList> {
        return NSFetchRequest<CarList>(entityName: "CarList")
    }

    @NSManaged public var engine: String?
    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var brand: String?

}

extension CarList : Identifiable {

    
}

