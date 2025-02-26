//
//  Product.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/25/25.
//

import Foundation

struct ProductArray: Decodable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Decodable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let category: String
    let stock: Int
    let brand: String?
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
