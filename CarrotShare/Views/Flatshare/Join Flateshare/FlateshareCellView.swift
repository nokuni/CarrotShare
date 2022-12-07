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
    @Binding var selectedFlatshare: Flatshare?
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
                    selectedFlatshare = flatshare
                    showAlert.toggle()
                    print(flatshare.id)
                } label: {
                    SmallButtonView(text: "Join", color: Color("AppGreen"))
                }
            }
            .font(.title2)
            .padding()
            Divider()
        }
    }
}
