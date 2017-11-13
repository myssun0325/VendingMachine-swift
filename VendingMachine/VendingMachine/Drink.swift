//
//  Drink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Drink: CustomStringConvertible {
    var brand: String
    var weight: String
    var price: String
    var name: String
    var dateOfManufacture: String
    
    init(brand: String, weight: String, price: String, name: String, dateOfManufacture: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
    
    func printDrinkInfo() {
        var printString = ""
        printString += self.brand
        printString += self.weight
        printString += self.price
        printString += self.name
        printString += self.dateOfManufacture
        print(printString)
    }

}
