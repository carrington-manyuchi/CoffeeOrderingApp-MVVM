//
//  Order.swift
//  CoffeeOrderingApp-MVVM
//
//  Created by DA MAC M1 157 on 2023/06/06.
//

import UIKit

enum CoffeeType: String, Codable, CaseIterable {
    case latte
    case capuccino
    case cortado
    case expressino
}

enum CoffeeSize: String, Codable, CaseIterable {
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



extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize =  CoffeeSize(rawValue: vm.selectedSize!.lowercased())
        else {
                    return nil
              }
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
