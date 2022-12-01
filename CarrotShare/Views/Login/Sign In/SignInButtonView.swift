//
//  SignInButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignInButtonView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    @Binding var fields: [String]
    @Binding var isShowingAlert: Bool
    var body: some View {
        Button(action: {
            if fields.contains("") {
                isShowingAlert.toggle()
            } else {
                carrotShareVM.isLoggedIn = true
                #warning("Sign In logic")
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
        SignInButtonView(fields: .constant([]), isShowingAlert: .constant(false))
    }
}
