//
//  SignInWithAppleButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            switch result {
            case .success(_):
                print("Authorisation successful")
            case .failure(let error):
                print("Authorisation failed: \(error.localizedDescription)")
            }
        }
        .cornerRadius(30)
        .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
        .padding()
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
    }
}

struct SignInWithAppleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleButtonView()
    }
}
