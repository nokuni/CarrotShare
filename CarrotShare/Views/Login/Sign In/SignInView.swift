//
//  SignInView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack {
            SignInFieldsView()
            SignInButtonView()
            Spacer()
            SignInWithAppleButtonView()
            Spacer()
        }
        .navigationTitle("Sign In")
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
