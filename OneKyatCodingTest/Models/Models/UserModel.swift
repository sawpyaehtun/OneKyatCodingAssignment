//
//  UserModel.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 30/01/2022.
//

import Foundation

final class UserModel {
    static let shared : UserModel = UserModel()
}

// MARK: - UserDefault
extension UserModel {
    
    /* first time use */
    func setIsFirstTimeUse(isFirstTime : Bool){
        UserDefaultManager.saveBoolToNSUserDefault(value: isFirstTime, key: .IS_FIRST_TIME_USE)
    }
    
    func getIsFirstTimeUse()->Bool{
        return UserDefaultManager.retrieveBoolFromNSUserDefault(key: .IS_FIRST_TIME_USE)
    }
}
