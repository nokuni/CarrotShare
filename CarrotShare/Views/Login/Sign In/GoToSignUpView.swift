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
            TransparentAppButtonView(text: "Sign Up")
        }
        .padding()
    }
}

struct GoToSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        GoToSignUpView()
    }
}
