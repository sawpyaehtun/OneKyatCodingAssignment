//
//  String + Extension.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit

extension String {
    enum RegularExpressions: String {
        case phone = "^(09|\\+)[0-9]\\d{6,12}$"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
    
    func isValidPhone() -> Bool {
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", RegularExpressions.phone.rawValue)
        return phoneTest.evaluate(with: self)
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeACall() {
        if let url = URL(string: "tel://\(onlyDigits())"),
           UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
}
