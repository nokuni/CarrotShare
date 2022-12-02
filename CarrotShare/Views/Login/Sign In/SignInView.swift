//
//  SignInView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignInView: View {
    @State private var isShowingAlert: Bool = false
    @State private var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            SignInFieldsView(username: $username, password: $password)
            SignInButtonView(username: $username, password: $password, isShowingAlert: $isShowingAlert)
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
