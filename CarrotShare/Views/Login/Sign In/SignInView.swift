//
//  SignInView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignInView: View {
    @State var fields = [String](repeating: "", count: 3)
    @State private var isShowingAlert: Bool = false
    var body: some View {
        VStack {
            SignInFieldsView(fields: $fields)
            SignInButtonView(fields: $fields, isShowingAlert: $isShowingAlert)
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
