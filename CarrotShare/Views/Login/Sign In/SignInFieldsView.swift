//
//  SignInFieldsView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignInFieldsView: View {
    enum SignInField: String, CaseIterable {
        case username = "Username"
        case email = "Email"
        case password = "Password"
    }
    @FocusState var signInField: SignInField?
    @Binding var fields: [String]
    var body: some View {
        VStack(spacing: 0) {
            ForEach(SignInField.allCases.indices, id: \.self) { index in
                TextField("", text: $fields[index])
                    .placeholderStyle(isPlaceholderShowing: fields[index].isEmpty) {
                        Text(SignInField.allCases[index].rawValue)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(
                        Color(UIColor.systemGray6).cornerRadius(30)
                    )
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                    .focused($signInField, equals: SignInField.allCases[index])
                    .onSubmit {
                        switch SignInField.allCases[index] {
                        case .username:
                            signInField = .email
                        case .email:
                            signInField = .password
                        case .password:
                            signInField = nil
                        }
                    }
            }
        }
    }
}

struct SignInFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        SignInFieldsView(fields: .constant([]))
    }
}
