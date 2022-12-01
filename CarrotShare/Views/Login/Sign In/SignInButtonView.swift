//
//  SignInButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignInButtonView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    var body: some View {
        Button(action: {
            carrotShareVM.isLoggedIn = true
            #warning("Sign In logic")
        }) {
            AppButtonView(text: "Sign In", color: .appGreen)
        }
    }
}

struct SignInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignInButtonView()
    }
}
