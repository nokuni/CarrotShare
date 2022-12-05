//
//  CreateFlatshareView.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 03/12/2022.
//

import SwiftUI

enum CreateFlateshare: String, CaseIterable {
    case name = "name"
    case personCount = "Person Count"
    case roomCount = "Room Count"
    case code = "Code"
}

struct CreateFlatshareView: View {
    
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    @State private var name: String = ""
    @State private var personCount: Int = 0
    @State private var roomCount: Int = 0
    @State private var image: String? = ""
    @State private var code: String = ""
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct CreateFlatshareView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlatshareView()
    }
}


struct CreateFlatshareFieldView: View {
    var createFlatshareField: FocusState<CreateFlateshare?>.Binding
    var selectedField: CreateFlateshare?
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
            .focused(createFlatshareField, equals: selectedField)
    }
}
