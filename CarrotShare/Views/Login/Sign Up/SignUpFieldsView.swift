//
//  SignUpFieldsView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

enum SignUpField: String, CaseIterable {
    case username = "Username"
    case email = "Email"
    case password = "Password"
    case repeatPassword = "Repeat Password"
}

struct SignUpFieldsView: View {
    @FocusState var signUpField: SignUpField?
    @Binding var username: String
    @Binding var email: String
    @Binding var password: String
    @Binding var repeatPassword: String
    var body: some View {
        VStack(spacing: 0) {
            
            SignUpFieldView(signUpField: $signUpField, selectedField: .username, field: $username)
            
            SignUpFieldView(signUpField: $signUpField, selectedField: .email, field: $email)
            
            SignUpFieldView(signUpField: $signUpField, selectedField: .password, field: $password)
            
            SignUpFieldView(signUpField: $signUpField, selectedField: .repeatPassword, field: $repeatPassword)
        }
        .onSubmit {
            switch signUpField {
            case .username:
                signUpField = .email
            case .email:
                signUpField = .password
            case .password:
                signUpField = .repeatPassword
            case .repeatPassword:
                signUpField = nil
            case .none:
                print("ERROR")
            }
        }
        .onAppear { signUpField = .username }
    }
}

struct SignUpFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFieldsView(username: .constant(""), email: .constant(""), password: .constant(""), repeatPassword: .constant(""))
    }
}

struct SignUpFieldView: View {
    var signUpField: FocusState<SignUpField?>.Binding
    var selectedField: SignUpField?
    @Binding var field: String
    var body: some View {
        TextField("", text: $field)
            .placeholderStyle(isPlaceholderShowing: field.isEmpty) {
                Text(selectedField?.rawValue ?? "")
                    .foregroundColor(.gray)
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .padding()
            .background(
                Color(UIColor.systemGray6).cornerRadius(30)
            )
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
            .focused(signUpField, equals: selectedField)
    }
}

