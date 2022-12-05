//
//  CreateFlatshareView.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 03/12/2022.
//

import SwiftUI

struct CreateFlatshareView: View {
    
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    @Binding var isShowingAlert: Bool
    @Binding var name: String
    @Binding var personCount: String
    @Binding var roomCount: String
//    @State private var image: String? = ""
    @Binding var code: String
    
    var body: some View {
        VStack {
            FlatshareFieldsView(name: $name, personCount: $personCount, roomCount: $roomCount, code: $code)
            CreateFlatshareButtonView(name: $name, personCount: $personCount, roomCount: $roomCount, code: $code, isShowingAlert: $isShowingAlert)
            Spacer()
        }
        .navigationTitle("Create your flatshare")
        .background {
            Color.appOrange
                .ignoresSafeArea()
        }
    }
}

struct CreateFlatshareView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlatshareView(isShowingAlert: .constant(false), name: .constant(""), personCount: .constant(""), roomCount: .constant(""), code: .constant(""))
    }
}
