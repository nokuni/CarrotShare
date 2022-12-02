//
//  User.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    var userName: String
    var email: String
    var password: String
    var image: String?
    var carrotWallet: Int
    var trophy: Int?
    var chore: Chore
}

extension User {
    static var example: User {
        User(id: 0, userName: "John Doe", email: "", password: "", carrotWallet: 0, chore: .choreMock())
    }
}

extension Array where Element == User {
    static let mockUsers: [User] =
    [
        User(id: 1, userName: "Christophe", email: "", password: "", image: "christophe", carrotWallet: 7, trophy: 1, chore: .choreMock()),
        User(id: 2, userName: "Joe", email: "", password: "", image: "joe", carrotWallet: 9, trophy: 0, chore: .choreMock()),
        User(id: 3, userName: "Nat", email: "", password: "", image: "nat", carrotWallet: 9, trophy: 0, chore: .choreMock()),
        User(id: 4, userName: "Yann-C", email: "", password: "", image: "yannc", carrotWallet: 9, trophy: 1, chore: .choreMock())
    ]
}

extension User {
    static func mock() -> User {
        User(id: 8, userName: "Christophe", email: "", password: "", image: "christophe", carrotWallet: 7, trophy: 1, chore: .choreMock())
    }
}
