//
//  OrderListViewModel.swift
//  CoffeeOrderingApp-MVVM
//
//  Created by DA MAC M1 157 on 2023/06/06.
//

import UIKit

struct OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.orderViewModel(at: index)
    }
}
