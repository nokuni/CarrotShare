//
//  WheelBackgroundView.swift
//  CarrotShare
//
//  Created by CHRISTOPHE LEHOUSSINE on 05/12/2022.
//

import SwiftUI

struct WheelBackgroundView: View {
    @ObservedObject var wheel: Wheel
    var body: some View {
        ZStack {
            LineView(angle: .degrees(180))
            LineView(angle: .degrees(135))
            LineView(angle: .degrees(45))
            LineView(angle: .degrees(90))
            WheelBoardView(wheel: wheel)
        }
    }
}

struct WheelBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        WheelBackgroundView(wheel: Wheel())
    }
}
