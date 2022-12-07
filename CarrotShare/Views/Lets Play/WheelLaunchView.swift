//
//  WheelLaunchView.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 07/12/2022.
//

import SwiftUI

struct WheelLaunchView: View {
    @ObservedObject var wheel: Wheel
    var body: some View {
        if let winner = wheel.winner {
            ResultWheelView(username: winner)
        } else {
            WheelView(wheel: wheel)
        }
    }
}

struct WheelLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        WheelLaunchView(wheel: Wheel())
    }
}
