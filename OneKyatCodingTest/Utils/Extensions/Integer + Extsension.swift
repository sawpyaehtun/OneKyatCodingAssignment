//
//  Integer + Extsension.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 30/01/2022.
//

import Foundation

extension Int {
    
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    func commaRepresentation(unit: Currency) -> String {
            let commaPres = Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
        return commaPres + " \(unit.rawValue)"
    }
}
