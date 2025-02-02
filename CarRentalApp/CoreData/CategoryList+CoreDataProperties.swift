//
//  CategoryList+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 30.12.24.
//
//

import Foundation
import CoreData


extension CategoryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryList> {
        return NSFetchRequest<CategoryList>(entityName: "CategoryList")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var size: String?
    @NSManaged public var isSelected: Bool

}

extension CategoryList : Identifiable {

}
