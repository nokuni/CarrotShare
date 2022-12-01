//
//  GoToSignUpView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct GoToSignUpView: View {
    var body: some View {
        NavigationLink(destination: SignUpView()) {
            TransparentAppButtonView(text: "Sign Up", size: CGSize(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.07))
        }
        .padding()
    }
}

struct GoToSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        GoToSignUpView()
    }
}
