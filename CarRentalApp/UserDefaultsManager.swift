//
//  UserDefaultsManager.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 22.12.24.
//

import Foundation

class UserDefaultsManager {
    enum UserDefaultsTypes: String {
        case isDataLoaded = "dataLoaded"
        case isLoggedIn = "loggedIn"
    }
    
    func setValue(value: Any, key: UserDefaultsTypes) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    func getBool(key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
}
