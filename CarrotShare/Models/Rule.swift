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
    var category: Category
    
    enum Category: String, CaseIterable {
        case chore
        case menu
        case movie
        case TV
        case flatOneHour
        case flatTwoHours
    }
}

extension Rule {
    static var rules: [Rule] {
        [
            Rule(text: "Choose a flatmate to do your chore for", amount: 2, category: .chore),
            Rule(text: "Choose the menu for", amount: 10, category: .menu),
            Rule(text: "Choose a movie for", amount: 10, category: .movie),
            Rule(text: "Book the TV for", amount: 15, category: .TV),
            Rule(text: "Book the flat to yourself for 1 hour for", amount: 25, category: .flatOneHour),
            Rule(text: "Book the flat to yourself for 2 hours for", amount: 50, category: .flatTwoHours)
        ]
    }
}
