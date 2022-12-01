//
//  Flatmate.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import Foundation

struct Flatmate: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var carrotNumber: Int
    var trophyNumber: Int
    
    static let `default` = [
        Flatmate(name: "Christophe", imageName: "christophe", carrotNumber: 7, trophyNumber: 1),
        Flatmate(name: "Joe", imageName: "joe", carrotNumber: 9, trophyNumber: 0),
        Flatmate(name: "Nat", imageName: "nat", carrotNumber: 9, trophyNumber: 0),
        Flatmate(name: "Yann-C", imageName: "yannc", carrotNumber: 9, trophyNumber: 1)
    ]
}
