//
//  LaunchWheelButtonView.swift
//  CarrotShare
//
//  Created by CHRISTOPHE LEHOUSSINE on 05/12/2022.
//

import SwiftUI

struct LaunchWheelButtonView: View {
    @ObservedObject var wheel: Wheel
    var body: some View {
        Button(action: {
            wheel.start()
        }) {
            Text("Launch the wheel !")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(Color(UIColor.systemBackground))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red.cornerRadius(8))
        }
        .padding()
        .disabled(wheel.isRotating)
    }
}
