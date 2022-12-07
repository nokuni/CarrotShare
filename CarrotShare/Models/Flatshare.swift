//
//  Flatshare.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 02/12/2022.
//

import Foundation

struct Flatshare: Codable, Identifiable {
    var id: Int?
    var name: String?
    var personCount: String?
    var roomCount: String?
    var image: String?
    var code: String?
    var user: [User]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, personCount, roomCount, image, code
    }
}
