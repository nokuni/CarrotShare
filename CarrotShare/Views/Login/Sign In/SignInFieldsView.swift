//
//  SignInFieldsView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

enum SignInField: String, CaseIterable {
    case username = "Username"
    case password = "Password"
}

struct SignInFieldsView: View {
    @FocusState var signInField: SignInField?
    @Binding var username: String
    @Binding var password: String
    var body: some View {
        VStack(spacing: 0) {
            SignInFieldView(signInField: $signInField, selectedField: .username, field: $username)
            SignInFieldView(signInField: $signInField, selectedField: .password, field: $password)
        }
        .onSubmit {
            switch signInField {
            case .username:
                signInField = .password
            case .password:
                signInField = nil
            case .none:
                print("error")
            }
        }
    }
}

struct SignInFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        SignInFieldsView(username: .constant(""), password: .constant(""))
    }
}

struct SignInFieldView: View {
    var signInField: FocusState<SignInField?>.Binding
    var selectedField: SignInField?
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
            .focused(signInField, equals: selectedField)
    }
}
