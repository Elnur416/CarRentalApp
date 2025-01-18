//
//  Models.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 22.12.24.
//

import Foundation


struct CarModel: Codable {
    let engine: String?
    let category: CategoryModel?
    let image: String?
    let name: String?
    let price: String?
    let brand: String?
}

struct CategoryModel: Codable {
    let name: String?
    let image: String?
    let size: String?
    var isSelected: Bool = false
}
