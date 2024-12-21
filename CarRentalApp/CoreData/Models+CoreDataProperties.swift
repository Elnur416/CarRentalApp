//
//  Models+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//
//

import Foundation
import CoreData


extension Models {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Models> {
        return NSFetchRequest<Models>(entityName: "Models")
    }

    @NSManaged public var brand: String?
    @NSManaged public var model: String?
    @NSManaged public var price: Int16
    @NSManaged public var engine: String?

}

extension Models : Identifiable {

}
