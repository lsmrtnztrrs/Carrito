//
//  Products.swift
//  Carrito
//
//  Created by Martin on 7/26/19.
//  Copyright © 2019 Martin. All rights reserved.
//

import UIKit

struct Product {
    
    let name : String
    let description : String
    let price : Double
    
}

let zapatos = [Product(name: "Nike", description: "Zapato deportivo", price: 100), Product(name: "Adidas", description: "Otro zapato deportivo", price: 200)]

let ropa = [Product(name: "Playera", description: "Para vestir", price: 50), Product(name: "Pantalon", description: "Para vestir", price: 100)]


let products = [zapatos, ropa]
let sectionsName = ["Zapatos", "Ropa"]
