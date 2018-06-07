//
//  Coke.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coke: Soda {
    
    private let hasIce: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, calories: Int, hasIce: Bool) {
        self.hasIce = hasIce
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, calories: calories)
    }
}
