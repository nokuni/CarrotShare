//
//  WheelBoardView.swift
//  CarrotShare
//
//  Created by CHRISTOPHE LEHOUSSINE on 05/12/2022.
//

import SwiftUI

struct WheelBoardView: View {
    @ObservedObject var wheel: Wheel
    var body: some View {
        ZStack {
            ForEach(wheel.elements) { element in
                ZStack {
                    VStack(spacing: 0) {

                        Image("\(element.userImage)")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.height * 0.06, height: UIScreen.main.bounds.height * 0.06)
                    }
                }
                .rotationEffect(.degrees(0))
                .frame(width: element.frame.0, height: element.frame.1, alignment: element.frame.2)
            }
        }
    }
}

struct WheelBoardView_Previews: PreviewProvider {
    static var previews: some View {
        WheelBoardView(wheel: Wheel())
    }
}
