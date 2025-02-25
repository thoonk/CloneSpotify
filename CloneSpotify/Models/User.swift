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
}
