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
    var isAllFieldsFilled: Bool { !username.isEmpty && !password.isEmpty }
    var body: some View {
        Button(action: {
            if isAllFieldsFilled {
                Task {
                    do {
                        carrotShareVM.signInResponse = try await carrotShareVM.signIn(userName: username, password: password)
                        await carrotShareVM.checkLogins(isAllFieldsFilled: isAllFieldsFilled, username: username, password: password)
                        carrotShareVM.user = try await carrotShareVM.fetchUser()
                    } catch {
                        carrotShareVM.signInAlertError = .wrongLogins
                        carrotShareVM.isShowingLoginAlert.toggle()
                    }
                }
            } else {
                carrotShareVM.signInAlertError = .incompleteFields
                carrotShareVM.isShowingLoginAlert.toggle()
            }
        }) {
            AppButtonView(text: "Sign In", color: .appGreen)
        }
        .alert(carrotShareVM.signInAlertError.title, isPresented: $carrotShareVM.isShowingLoginAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(carrotShareVM.signInAlertError.message)
        }
    }
}

struct SignInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignInButtonView(username: .constant(""), password: .constant(""))
    }
}
