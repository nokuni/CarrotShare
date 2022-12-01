//
//  TransparentAppButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct TransparentAppButtonView: View {
    var text: String
    var body: some View {
        Capsule()
            .stroke(lineWidth: 3)
            .fill(LinearGradient(colors: [.appGreen, .appOrange], startPoint: .leading, endPoint: .trailing))
            .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.07)
            .overlay(
                LinearGradient(
                    colors: [.appGreen, .appOrange],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask(
                    Text(text)
                        .fontWeight(.semibold)
                        .font(.title3)
                )
            )
    }
}

struct TransparentAppButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TransparentAppButtonView(text: "Sign Up")
    }
}
