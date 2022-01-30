//
//  UserDefaultManager.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 30/01/2022.
//

import Foundation
import RealmSwift

struct UserDefaultManager {
    
     //MARK:- Keys
    
    enum Key : String{
        
        case IS_FIRST_TIME_USE = "IS_FIRST_TIME_USE"
        
        func getKey() -> String {
            return rawValue
        }
        
    }
    
    
    // MARK:- Setting and getting Bool in NSUserDefault
    static func saveBoolToNSUserDefault(value: Bool, key: Key) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func retrieveBoolFromNSUserDefault(key:Key) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    // MARK:- Setting and getting String in NSUserDefault
    static func saveStringToNSUserDefault(value: String, key: Key) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func retrieveStringFromNSUserDefault(key: Key) -> String {
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    // MARK:- Setting and getting Int in NSUserDefault
    static func saveIntToNSUserDefault(value: Int, key: Key) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func retrieveIntFromNSUserDefault(key: Key) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    // MARK:- Setting and getting UInt64 in NSUserDefault
    static func saveIntToNSUserDefault(value: UInt64, key: Key) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func retrieveIntFromNSUserDefault(key: Key) -> UInt64 {
        return UInt64(UserDefaults.standard.integer(forKey: key.rawValue))
    }
    
    // MARK:- Setting and getting Object as Data in NSUserDefault
    static func saveObjectToNSUserDefault(value: Data, key: Key) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func retrieveObjectFromNSUserDefault(key:Key) -> Data? {
        return UserDefaults.standard.object(forKey: key.rawValue) as? Data
    }
    
    // MARK:- remove
       static func removeObj(key : Key){
           UserDefaults.standard.removeObject(forKey: key.rawValue)
       }
    
  
}
