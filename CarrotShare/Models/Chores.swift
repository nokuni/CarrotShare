//
//  Chores.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct Chore: Identifiable {
    var id = UUID()
    let description: String
    let color: Color
    let day: Int
    var user: User
}

extension Chore {
    static var all: [Chore] {
        [
            Chore(description: "Hover, mop and scrub bathroom", color: .choreBlue, day: 2, user: User.example),
            Chore(description: "Do the dishes", color: .choreOrange, day: 6, user: User.example),
            Chore(description: "Hover, mop and scrub kitchen", color: .choreTurquoise, day: 8, user: User.example),
            Chore(description: "Take out rubbish", color: .chorePink, day: 23, user: User.example),
            Chore(description: "Hover, mop and scrub living room", color: .choreYellow,  day: 16, user: User.example),
            Chore(description: "Food shopping", color: .choreGreen,  day: 11, user: User.example),
            Chore(description: "Scrub toilet", color: .choreRed,  day: 27, user: User.example),
        ]
    }
}
