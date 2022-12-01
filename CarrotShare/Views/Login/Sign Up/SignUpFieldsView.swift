//
//  SignUpFieldsView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignUpFieldsView: View {
    enum SignUpField: String, CaseIterable {
        case username = "Username"
        case email = "Email"
        case password = "Password"
        case repeatPassword = "Repeat Password"
    }
    @FocusState var signUpField: SignUpField?
    @State var fields = [String](repeating: "", count: SignUpField.allCases.count)
    var body: some View {
        VStack(spacing: 0) {
            ForEach(SignUpField.allCases.indices, id: \.self) { index in
                TextField("", text: $fields[index])
                    .placeholderStyle(isPlaceholderShowing: fields[index].isEmpty) {
                        Text(SignUpField.allCases[index].rawValue)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(
                        Color(UIColor.systemGray6).cornerRadius(30)
                    )
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                    .focused($signUpField, equals: SignUpField.allCases[index])
                    .onSubmit {
                        switch SignUpField.allCases[index] {
                        case .username:
                            signUpField = .email
                        case .email:
                            signUpField = .password
                        case .password:
                            signUpField = .repeatPassword
                        case .repeatPassword:
                            signUpField = nil
                        }
                    }
                    .onAppear { signUpField = .username }
            }
        }
    }
}

struct SignUpFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFieldsView()
    }
}
