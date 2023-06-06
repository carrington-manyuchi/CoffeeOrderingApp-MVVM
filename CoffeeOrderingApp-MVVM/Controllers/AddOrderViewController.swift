//
//  AddOrderViewController.swift
//  CoffeeOrderingApp-MVVM
//
//  Created by DA MAC M1 157 on 2023/06/06.

import UIKit

class AddOrderViewController: UIViewController {
    
    private var vm = AddCoffeeOrderViewModel()
    private var coffeeSizesSegmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.coffeeSizesSegmentControl = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSizesSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(coffeeSizesSegmentControl)
        self.coffeeSizesSegmentControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        self.coffeeSizesSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
    @IBAction func save() {
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        
        let selectedSize = self.coffeeSizesSegmentControl.titleForSegment(at: self.coffeeSizesSegmentControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting Coffee")
        }
        
        self.vm.name = name
        self.vm.email = email
        self.vm.selectedSize = selectedSize
        self.vm.selectedType = self.vm.types[indexPath.row]
        
        Webservice().load(resource: Order.create(vm: self.vm)) { result in
            switch result {
            case .success(let order):
                print(order)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}



//MARK: - METHODS
extension AddOrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.vm.types[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
