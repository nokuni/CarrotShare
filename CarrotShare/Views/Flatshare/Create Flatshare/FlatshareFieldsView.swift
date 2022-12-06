//
//  FlatshareFieldsView.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 05/12/2022.
//

import SwiftUI

enum FlateshareField: String, CaseIterable {
    case name = "Name"
    case personCount = "Person count"
    case roomCount = "Room count"
    case code = "Code"
}

struct FlatshareFieldsView: View {
    @FocusState var flateshareField: FlateshareField?
    @Binding var name: String
    @Binding var personCount: String
    @Binding var roomCount: String
    @Binding var code: String
    var body: some View {
        VStack(spacing: 0) {
            FlatshareFieldView(flatshareField: $flateshareField, selectedField: .name, field: $name)
            FlatshareFieldView(flatshareField: $flateshareField, selectedField: .personCount, field: $personCount)
            FlatshareFieldView(flatshareField: $flateshareField, selectedField: .roomCount, field: $roomCount)
            FlatshareFieldView(flatshareField: $flateshareField, selectedField: .code, field: $code)
        }
        .onSubmit {
            switch flateshareField {
            case .name:
                flateshareField = .personCount
            case .personCount:
                flateshareField = .roomCount
            case .roomCount:
                flateshareField = .code
            case .code:
                flateshareField = nil
            case .none:
                print("error")
                
            }
        }
    }
}

struct FlatshareFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        FlatshareFieldsView(name: .constant(""), personCount: .constant(""), roomCount: .constant(""), code: .constant(""))
    }
}

struct FlatshareFieldView: View {
    var flatshareField: FocusState<FlateshareField?>.Binding
    var selectedField: FlateshareField?
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
            .focused(flatshareField, equals: selectedField)
    }
}
