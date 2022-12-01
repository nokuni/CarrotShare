//
//  SignUpView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct SignUpView: View {
    @State var fields = [String](repeating: "", count: 4)
    @State private var isShowingAlert: Bool = false
    var body: some View {
        VStack {
            SignUpFieldsView(fields: $fields)
            SignUpButtonView(fields: $fields, isShowingAlert: $isShowingAlert)
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
