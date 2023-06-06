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
    
    static var all: Resource<[Order]> = {
        guard let url  = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect")
        }
    return Resource<[Order]>(url: url)
    }()
    
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
         let order = Order(vm)
        guard let url  = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect")
        }
        
        guard let data = try? JSONEncoder().encode(order)  else {
            fatalError("Error encoding error")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
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
