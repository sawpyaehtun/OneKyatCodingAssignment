//
//  UITableView + Extension.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit

public extension UITableView {
    
    func registerForCells<T>(cells : T...) {
        cells.forEach { (cell) in
            register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: String(describing: cell))
        }
    }
    
    func registerForCells<T>(cells : [T]) {
        cells.forEach { (cell) in
            register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: String(describing: cell))
        }
    }
    
    func dequeReuseCell<T>(type : T.Type, indexPath : IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as! T
    }
    
}
