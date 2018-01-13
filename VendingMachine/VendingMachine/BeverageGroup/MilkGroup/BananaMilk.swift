//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private var kindOfMilk: String = "바나나우유"
    private var bananaSyrup: Int = 1
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, bananaSyrup: Int) {
        self.bananaSyrup = bananaSyrup
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
    }
    override var description: String {
        return "\(self.kindOfMilk)(BananaMilk)\(super.description)"
    }
    
    func quantityOfBananaSyrup() -> Int {
        return self.bananaSyrup
    }
}