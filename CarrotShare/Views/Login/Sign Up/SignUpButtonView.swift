//
//  SignUpButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignUpButtonView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    @Binding var username: String
    @Binding var email: String
    @Binding var password: String
    @Binding var repeatPassword: String
    @Binding var isShowingAlert: Bool
    
    var isAllFieldsFilled: Bool {
        !username.isEmpty && !email.isEmpty && !password.isEmpty  && !repeatPassword.isEmpty
    }
    var body: some View {
        Button(action: {
            Task {
                if isAllFieldsFilled {
                    carrotShareVM.isApplyingSettings = true
                    carrotShareVM.isLoggedIn = true
                } else {
                    isShowingAlert.toggle()
                }
                carrotShareVM.user = try await carrotShareVM.signUp(userName: username, email: email, password: password)
            }
        }) {
            AppButtonView(text: "Sign Up", color: .appGreen)
        }
        .alert("Incompleted Fields", isPresented: $isShowingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Each field needs to be completed to sign up")
        }
    }
}

struct SignUpButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButtonView(username: .constant(""), email: .constant(""), password: .constant(""), repeatPassword: .constant(""), isShowingAlert: .constant(false))
    }
}
