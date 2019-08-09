//
//  DetailViewController.swift
//  Carrito
//
//  Created by Martin on 7/26/19.
//  Copyright © 2019 Martin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var product: Product?
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var Price: UILabel!
    
    var tableFooter = UIView()
    var labelfooter = UILabel()
    var numberOfItems = 0
    
    var tableController: ProductsTableViewController?
    
    var quantity = 0.0 {
        willSet {
            productQuantity.text = "\(newValue)"
            totalLabel.text = "\(product!.price * newValue)"
        }
    }
    
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let product = product, let controller = tableController {
            productName.text = product.name
            Price.text = String(product.price)
            
            if let productQuantity = controller.shoppingList[product.name]{
                let quantityOfProduct = Double(productQuantity.0)
                totalLabel.text = "\(productQuantity.1)"
                quantity = quantityOfProduct
                stepper.value = quantityOfProduct
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let product = product, let controller = tableController {
            controller.shoppingList[product.name] = (Int(quantity), quantity * product.price)
        }
    }
    
    @IBAction func changeProductQuantity(_ sender: Any) {
        let stepper = sender as! UIStepper
        quantity = stepper.value
    }
    

}
