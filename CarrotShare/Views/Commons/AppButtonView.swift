//
//  AppButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct AppButtonView: View {
    var text: String
    var color: Color
    var body: some View {
        Capsule()
            .foregroundColor(color)
            .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.07)
            .overlay(
                Text(text)
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundColor(Color(UIColor.systemBackground))
            )
    }
}

struct AppButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AppButtonView(text: "Sign In", color: .appGreen)
    }
}
