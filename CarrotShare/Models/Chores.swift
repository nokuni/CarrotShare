//
//  Chores.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct Chore: Identifiable, Codable {
    let id: Int
    let content: String
    let category: Category
    var isDone: Bool
    let day: Int?
    var carrotAmount: Int
    
    enum Category: String, Codable {
        case cleanBathRoom, dishes, cleanKitchen, takeOutRubbish, cleanLivingRoom, foodShopping, cleanToilet
        
        var color: Color {
            switch self {
            case .cleanBathRoom:
                return .choreBlue
            case .dishes:
                return .choreOrange
            case .cleanKitchen:
                return .choreTurquoise
            case .takeOutRubbish:
                return .chorePink
            case .cleanLivingRoom:
                return .choreYellow
            case .foodShopping:
                return .choreGreen
            case .cleanToilet:
                return .choreRed
            }
        }
    }
}

extension Chore {
    static func choreMock() -> Chore {
        Chore(id: 0, content: "Nettoyer la salle de bain", category: .cleanBathRoom, isDone: false, day: 1, carrotAmount: 2)
    }
}

