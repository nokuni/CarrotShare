//
//  SignInResponse.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 02/12/2022.
//

import Foundation

struct SignInResponse: Identifiable, Codable {
    var id: Int
    var username: String
    var email: String
    var password: String
}
