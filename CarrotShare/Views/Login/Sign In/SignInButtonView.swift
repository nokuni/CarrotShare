//
//  SignInButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignInButtonView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    @Binding var username: String
    @Binding var password: String
    @Binding var isShowingAlert: Bool
    
    var isAllFieldsFilled: Bool {
        !username.isEmpty && !password.isEmpty
    }
    var body: some View {
        Button(action: {
            Task {
                if isAllFieldsFilled {
                    carrotShareVM.isLoggedIn = true
                } else {
                    isShowingAlert.toggle()
                }
                carrotShareVM.signInResponse = try await carrotShareVM.signIn(userName: username, password: password)
            }
        }) {
            AppButtonView(text: "Sign In", color: .appGreen)
        }
        .alert("Incompleted Fields", isPresented: $isShowingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Each field needs to be completed to sign in")
        }
    }
}

struct SignInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignInButtonView(username: .constant(""), password: .constant(""), isShowingAlert: .constant(false))
    }
}
