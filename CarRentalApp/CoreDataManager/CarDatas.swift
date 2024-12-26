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
        let category = CategoryModel(name: "All Cars",
                                     image: "allCars",
                                     size: "12")
        categoryData.saveData(categoryModel: category)
        
        let category1 = CategoryModel(name: "Sedan",
                                      image: "sedan",
                                      size: "2")
        categoryData.saveData(categoryModel: category1)
        
        let category2 = CategoryModel(name: "Coupe",
                                      image: "coupe",
                                      size: "2")
        categoryData.saveData(categoryModel: category2)
        
        let category3 = CategoryModel(name: "Sport",
                                      image: "sport",
                                      size: "2")
        categoryData.saveData(categoryModel: category3)
        
        let category4 = CategoryModel(name: "SUV",
                                      image: "suv",
                                      size: "2")
        categoryData.saveData(categoryModel: category4)
        
        let category5 = CategoryModel(name: "Minivan",
                                      image: "minivan",
                                      size: "2")
        categoryData.saveData(categoryModel: category5)
        
        let category6 = CategoryModel(name: "Pickup",
                                      image: "pickup",
                                      size: "2")
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
        
        let car7 = CarModel(engine: "1.8-liter I-4",
                            category: category1,
                            image: "corolla",
                            name: "Corolla",
                            price: "300$",
                            brand: "Toyota")
        carData.saveData(carModel: car7)
        
        let car8 = CarModel(engine: "2.0 L Ti-VCT GDI I4",
                            category: category2,
                            image: "focus",
                            name: "Focus",
                            price: "300$",
                            brand: "Ford")
        carData.saveData(carModel: car8)
        
        let car9 = CarModel(engine: "3.6L Pentastar® V6",
                            category: category3,
                            image: "charger",
                            name: "Charger",
                            price: "$400$",
                            brand: "Dodge")
        carData.saveData(carModel: car9)
        
        let car10 = CarModel(engine: "3.0 L 6-cylinder",
                             category: category4,
                             image: "vogue",
                             name: "Vogue",
                             price: "500$",
                             brand: "Range Rover")
        carData.saveData(carModel: car10)
        
        let car11 = CarModel(engine: "2.2L V 220d",
                             category: category5,
                             image: "v-class",
                             name: "V-Class",
                             price: "400$",
                             brand: "Mercedes")
        carData.saveData(carModel: car11)
        
        let car12 = CarModel(engine: "201.15bhp@3000",
                             category: category6,
                             image: "hilux",
                             name: "Hilux",
                             price: "350$",
                             brand: "Toyota")
        carData.saveData(carModel: car12)
    }
}
