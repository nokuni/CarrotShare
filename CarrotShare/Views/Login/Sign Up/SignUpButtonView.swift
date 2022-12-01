//
//  SignUpButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignUpButtonView: View {
    var body: some View {
        Button(action: {
            #warning("Sign Up logic")
        }) {
            AppButtonView(text: "Sign Up", color: .appGreen)
        }
    }
}

struct SignUpButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButtonView()
    }
}
