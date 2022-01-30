//
//  String + Extension.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation

extension String {
    enum RegularExpressions: String {
        case phone = "^(09|\\+)[0-9]\\d{6,12}$"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
    
    func isValidPhone() -> Bool {
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", RegularExpressions.phone.rawValue)
        return phoneTest.evaluate(with: self)
    }
}
