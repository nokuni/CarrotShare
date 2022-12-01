//
//  LoginView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            LoginTitleView()
            LoginImageView()
            GoToSignInView()
            GoToSignUpView()
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
