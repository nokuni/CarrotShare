//
//  Rule.swift
//  CarrotShare
//
//  Created by N N on 02/12/2022.
//

import Foundation

struct Rule: Identifiable {
    var id = UUID()
    var text: String
    var amount: Int
}

let rules = [
    Rule(text: "Choose a flatmate to do your chore for", amount: 2),
    Rule(text: "Choose the menu for", amount: 10),
    Rule(text: "Choose a movie for", amount: 10),
    Rule(text: "Book the TV for", amount: 15),
    Rule(text: "Book the flat to yourself for 1 hour for", amount: 25),
    Rule(text: "Book the flat to yourself for 2 hours for", amount: 50)
]
