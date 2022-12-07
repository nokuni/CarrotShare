//
//  FlateshareCellView.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 07/12/2022.
//

import SwiftUI

struct FlateshareCellView: View {
    
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    var flatshare: Flatshare
    @Binding var showAlert: Bool
    @Binding var textInput: String
    
    var body: some View {
        VStack {
            HStack {
                if let name = flatshare.name {
                    Text(name)
                }
                Spacer()
                Button {
                    showAlert.toggle()
                } label: {
                    SmallButtonView(text: "Join", color: Color("AppGreen"))
                }
            }
            .font(.title2)
            .padding()
            Divider()
        }
        .alert("Join group", isPresented: $showAlert) {
            TextField("Code", text: $textInput)
            Button {
                Task {
                    carrotShareVM.flatshareResponse = try await carrotShareVM.joinFlatshare(index: flatshare.id!, code: textInput)
                }
            } label: {
                Text("Join")
            }
        } message: {
            if let name = flatshare.name {
                Text("Enter the code to join \(name)")
            }
        }
    }
}
