//
//  Product.swift
//  aeo_interview
//
//  Created by Yunxuan Yu on 6/15/23.
//

import SwiftUI

struct Product: Codable {
    let id: String
    let productCategory: String
    let productName: String
    let productImage: String
    let productStock: Bool
    let productPrice: String
    
    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case productCategory
        case productName
        case productImage
        case productStock
        case productPrice
    }
}

