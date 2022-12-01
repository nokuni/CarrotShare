//
//  CarrotShareViewModel.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

class CarrotShareViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isApplyingSettings: Bool = false
    @Published var chores: [Chore] = Chore.all
    
    func getChore(from index: Int) -> Chore? {
        if let choreIndex = chores.firstIndex(where: {
            $0.day == index
        }) {
            return chores[choreIndex]
        }
        return nil
    }
}
