//
//  CreateFlatshareButtonView.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 05/12/2022.
//

import SwiftUI

struct CreateFlatshareButtonView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    @Binding var name: String
    @Binding var personCount: String
    @Binding var roomCount: String
    @Binding var code: String
    @Binding var isShowingAlert: Bool
    
    var isAllFieldsFilled: Bool {
        !name.isEmpty && !personCount.isEmpty && !roomCount.isEmpty  && !code.isEmpty
    }
    var body: some View {
        Button(action: {
            Task {
                if isAllFieldsFilled {
                    carrotShareVM.isApplyingSettings = true
                } else {
                    isShowingAlert.toggle()
                }
            }
        }) {
            AppButtonView(text: "Create", color: .appGreen)
        }
        .alert("Incompleted Fields", isPresented: $isShowingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Each field needs to be completed to create your flatshare")
        }
    }
}

struct CreateFlatshareButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlatshareButtonView(name: .constant(""), personCount: .constant(""), roomCount: .constant(""), code: .constant(""), isShowingAlert: .constant(false))
    }
}
