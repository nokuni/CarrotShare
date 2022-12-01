//
//  LoginImageView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct LoginImageView: View {
    private let appImage = "carrotIcon"
    var body: some View {
        LinearGradient(
            colors: [.appGreen, .appOrange],
            startPoint: .leading,
            endPoint: .trailing
        )
        .frame(width: UIScreen.main.bounds.height * 0.15, height: UIScreen.main.bounds.height * 0.15)
        .mask(
            Image(appImage)
                .resizable()
                .frame(width: UIScreen.main.bounds.height * 0.15, height: UIScreen.main.bounds.height * 0.15)
        )
        .padding(.bottom, 40)
    }
}

struct LoginImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginImageView()
    }
}
