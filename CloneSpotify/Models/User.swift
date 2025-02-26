//
//  User.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/25/25.
//

import Foundation

struct UsersArray: Decodable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Decodable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
    
    static var mock: User {
        .init(
            id: 321,
            firstName: "Thoonk",
            lastName: "Kim",
            age: 23,
            email: "asdf@asdf.com",
            phone: "",
            username: "",
            password: "",
            image: Constants.randomImage,
            height: 180,
            weight: 200
        )
    }
}
