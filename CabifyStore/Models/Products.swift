//
//  Products.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 12/3/21.
//

import Foundation

struct Products: Codable {
    let products: [Product]
}

struct Product: Codable {
    let code, name: String
    let price: Double
}
