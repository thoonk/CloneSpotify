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
    
    static var mock: Product {
        Product(
            id: 123,
            title: "아이폰 14 Pro",
             description: "최신 A16 바이오닉 칩을 탑재한 애플의 플래그십 스마트폰",
             price: 130,
             discountPercentage: 5.5,
             rating: 4.8,
             category: "전자제품",
             stock: 42,
             brand: "Apple",
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage],
            thumbnail: Constants.randomImage
        )
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
