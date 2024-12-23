//
//  CarDatas.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 22.12.24.
//

import Foundation

class CarDatas {
    let carData = CoreDataForCar(context: AppDelegate().persistentContainer.viewContext)
    let categoryData = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
    
   
    func loadData() {
        //        categories
        let category1 = CategoryModel(name: "Sedan",
                                      image: "sedan",
                                      size: "1")
        categoryData.saveData(categoryModel: category1)
        
        let category2 = CategoryModel(name: "Coupe",
                                      image: "coupe",
                                      size: "1")
        categoryData.saveData(categoryModel: category2)
        
        let category3 = CategoryModel(name: "Sport",
                                      image: "sport",
                                      size: "1")
        categoryData.saveData(categoryModel: category3)
        
        let category4 = CategoryModel(name: "SUV",
                                      image: "suv",
                                      size: "1")
        categoryData.saveData(categoryModel: category4)
        
        let category5 = CategoryModel(name: "Minivan",
                                      image: "minivan",
                                      size: "1")
        categoryData.saveData(categoryModel: category5)
        
        let category6 = CategoryModel(name: "Pickup",
                                      image: "pickup",
                                      size: "1")
        categoryData.saveData(categoryModel: category6)
        
        
        //        cars
        let car1 = CarModel(engine: "V12",
                            category: category1,
                            image: "maybach",
                            name: "Maybach",
                            price: "550$",
                            brand: "Mercedes")
        carData.saveData(carModel: car1)
        
        let car2 = CarModel(engine: "V-8",
                            category: category2,
                            image: "s-class",
                            name: "S-Class",
                            price: "450$",
                            brand: "Mercedes")
        carData.saveData(carModel: car2)
        
        let car3 = CarModel(engine: "V12",
                            category: category3,
                            image: "aventador",
                            name: "Aventador",
                            price: "700$",
                            brand: "Lamborghini")
        carData.saveData(carModel: car3)
        
        let car4 = CarModel(engine: "V8",
                            category: category4,
                            image: "amg G63",
                            name: "AMG G63",
                            price: "500$",
                            brand: "Mercedes")
        carData.saveData(carModel: car4)
        
        let car5 = CarModel(engine: "2.0 L BlueHDI",
                            category: category5,
                            image: "compactMinivan",
                            name: "Expert Compact Minivan",
                            price: "400$",
                            brand: "Peugeot")
        carData.saveData(carModel: car5)
        
        let car6 = CarModel(engine: "3.5-liter V-6",
                            category: category6,
                            image: "raptor",
                            name: "Raptor",
                            price: "500$",
                            brand: "Ford")
        carData.saveData(carModel: car6)
    }
}
