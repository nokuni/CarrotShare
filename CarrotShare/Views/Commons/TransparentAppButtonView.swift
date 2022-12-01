//
//  TransparentAppButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct TransparentAppButtonView: View {
    var text: String
    var size: CGSize
    var body: some View {
        Capsule()
            .stroke(lineWidth: 3)
            .fill(LinearGradient(colors: [.appGreen, .appOrange], startPoint: .leading, endPoint: .trailing))
            .frame(width: size.width, height: size.height)
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
        TransparentAppButtonView(text: "Sign Up", size: CGSize.zero)
    }
}
