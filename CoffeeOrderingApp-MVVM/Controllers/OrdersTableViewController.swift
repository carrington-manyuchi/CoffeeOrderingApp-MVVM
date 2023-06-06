//
//  OrdersTableViewController.swift
//  CoffeeOrderingApp-MVVM
//
//  Created by DA MAC M1 157 on 2023/06/06.
//

import UIKit


class OrdersTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    
    
    func populateOrders() {
        guard let coffeeOrderURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL was incorrect")
        }
        
        
        let resource = Resource<[Order]>(url: coffeeOrderURL)
        
        Webservice().load(resource: resource) { result in
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
        }
    }
}
