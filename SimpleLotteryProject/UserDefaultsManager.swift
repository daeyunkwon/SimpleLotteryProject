//
//  UserDefaultsManager.swift
//  SimpleLotteryProject
//
//  Created by 권대윤 on 6/5/24.
//

import UIKit

struct UserDefaultsManager {
    var lastRound: Int {
        get {
            return UserDefaults.standard.integer(forKey: "round")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "round")
        }
    }
    
    var lastDateString: String? {
        get {
            return UserDefaults.standard.string(forKey: "date")
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "date")
        }
    }
}
