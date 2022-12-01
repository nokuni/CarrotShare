//
//  SignUpView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            SignUpFieldsView()
            SignUpButtonView()
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
