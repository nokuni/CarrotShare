//
//  SignUpButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignUpButtonView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    @Binding var fields: [String]
    @Binding var isShowingAlert: Bool
    var body: some View {
        Button(action: {
            if fields.contains("") {
                isShowingAlert.toggle()
            } else {
                #warning("Sign Up logic")
                carrotShareVM.isApplyingSettings = true
                carrotShareVM.isLoggedIn = true
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
        SignUpButtonView(fields: .constant([]), isShowingAlert: .constant(false))
    }
}
