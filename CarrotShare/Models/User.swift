//
//  User.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    var username: String?
    var email: String?
    var password: String?
    var image: String?
    var carrotWallet: Int?
    var trophy: Int?
    var flatshareId: Int = 1
    var chore: Chore = .choreMock()
    
    enum CodingKeys: String, CodingKey {
        case id, username, email, password, image, carrotWallet, trophy
        
    }
}

extension User {
    static var example: User {
        User(id: 0, username: "John Doe", email: "", password: "", carrotWallet: 0, chore: .choreMock())
    }
}

extension Array where Element == User {
    static let mockUsers: [User] =
    [
        User(id: 1, username: "Christophe", email: "", password: "", image: "christophe", carrotWallet: 7, trophy: 1, chore: .choreMock()),
        User(id: 2, username: "Joe", email: "", password: "", image: "joe", carrotWallet: 9, trophy: 0, chore: .choreMock()),
        User(id: 3, username: "Nat", email: "", password: "", image: "nat", carrotWallet: 9, trophy: 0, chore: .choreMock()),
        User(id: 4, username: "Yann-C", email: "", password: "", image: "yannc", carrotWallet: 9, trophy: 1, chore: .choreMock())
    ]
}

extension User {
    static func mock() -> User {
        User(id: 8, username: "Christophe", email: "", password: "", image: "christophe", carrotWallet: 7, trophy: 1, chore: .choreMock())
    }
}
