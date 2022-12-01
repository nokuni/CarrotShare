//
//  User.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import Foundation

struct User {
    var name: String
}

extension User {
    static var example: User {
        User(name: "John Doe")
    }
}
