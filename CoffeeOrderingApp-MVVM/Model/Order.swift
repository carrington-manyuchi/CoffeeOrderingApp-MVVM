//
//  Order.swift
//  CoffeeOrderingApp-MVVM
//
//  Created by DA MAC M1 157 on 2023/06/06.
//

import UIKit

enum CoffeeType: String, Codable {
    case latte
    case capuccino
    case cortado
    case expressino
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    
    let name: String
    let email: String
    let size: CoffeeSize
    let type: CoffeeType
}
