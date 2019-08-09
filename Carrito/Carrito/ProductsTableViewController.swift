//
//  ProductsTableViewController.swift
//  Carrito
//
//  Created by Martin on 7/26/19.
//  Copyright © 2019 Martin. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var selectedProduct: Product!

    var shoppingList: [String: (Int, Double)] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shoppingButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonToShoppingList))
        navigationItem.rightBarButtonItem = shoppingButton
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsName[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        let actualProduct = products[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = actualProduct.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = products[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "productDescription", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDescription" {
            let vc = segue.destination as! DetailViewController
            vc.product = selectedProduct
            vc.tableController = self
        }
        if segue.identifier == "product" {
            let vc = segue.destination as! AllProductsViewController
            vc.shoppingList = shoppingList
            
        }
    }
    
    @objc func buttonToShoppingList(){
        performSegue(withIdentifier: "product", sender: nil)
    }
    

}
