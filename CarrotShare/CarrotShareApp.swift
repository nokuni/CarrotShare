//
//  CarrotShareApp.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

@main
struct CarrotShareApp: App {
    @StateObject var carrotShareVM = CarrotShareViewModel()
    var body: some Scene {
        WindowGroup {
            ChoresView()
                .environmentObject(carrotShareVM)
        }
    }
}
