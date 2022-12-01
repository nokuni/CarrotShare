//
//  GoToSignInView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct GoToSignInView: View {
    var body: some View {
        NavigationLink(destination: SignInView()) {
            AppButtonView(text: "Sign In", color: .appGreen)
        }
        .padding()
    }
}

struct GoToSignInView_Previews: PreviewProvider {
    static var previews: some View {
        GoToSignInView()
    }
}
