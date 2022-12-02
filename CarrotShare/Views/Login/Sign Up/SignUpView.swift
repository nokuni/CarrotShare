//
//  SignUpView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

import SwiftUI

struct SignUpView: View {
    @State private var isShowingAlert: Bool = false
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    var body: some View {
        VStack {
            SignUpFieldsView(username: $username, email: $email, password: $password, repeatPassword: $repeatPassword)
            SignUpButtonView(username: $username, email: $email, password: $password, repeatPassword: $repeatPassword, isShowingAlert: $isShowingAlert)
            Spacer()
        }
        .navigationTitle("Sign Up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
