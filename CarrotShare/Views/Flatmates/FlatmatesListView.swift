//
//  FlatmatesListView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct FlatmatesListView: View {
    @State var isCreateView: Bool = false
    @State var isJoinView: Bool = false
    @State private var isShowingAlert: Bool = false
    @State private var name: String = ""
    @State private var personCount: String = ""
    @State private var roomCount: String = ""
//    @State private var image: String? = ""
    @State private var code: String = ""
    var body: some View {
        VStack(spacing: 25) {
            
            Text("You don't have any group !")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                isJoinView.toggle()
            }) {
                AppButtonView(text: "Join flateshare", color: .appGreen)
            }
            
            Button(action: {
                isCreateView.toggle()
            }) {
                TransparentAppButtonView(text: "Create flateshare", size: CGSize(width: UIScreen.main.bounds.width * 0.50, height: UIScreen.main.bounds.height * 0.07))
            }
            .sheet(isPresented: $isCreateView) {
                CreateFlatshareView(isShowingAlert: $isShowingAlert, name: $name, personCount: $personCount, roomCount: $roomCount, code: $code)
            }
        }
    }
}

struct FlatmatesListView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmatesListView()
    }
}
