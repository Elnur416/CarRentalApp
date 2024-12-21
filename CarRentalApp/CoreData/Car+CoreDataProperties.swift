//
//  Car+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var category: String?
    @NSManaged public var carCount: Int16

}

extension Car : Identifiable {

}
