//
//  SettingsView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    private let favoriteDays = ["my favorite days for chores", "my favorite days to cook diner", "my favorite days for fun", "my no go day"]
    @State var daysList = Array(repeating: "", count: 4)
    @State private var isShowingAlert: Bool = false
    var body: some View {
        VStack {
            Button(action: {
               //-MARK: add action
            }) {
                TransparentAppButtonView(text: "Upload your picture", size: CGSize(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.07))
            }
            .padding()
            
            ForEach(favoriteDays.indices, id: \.self) { index in
                SettingsButtonView(header: favoriteDays[index], days: $daysList[index])
            }
            
            Button(action: {
                if daysList.contains("") {
                    isShowingAlert.toggle()
                } else {
                    carrotShareVM.isApplyingSettings = false
                }
            }) {
                AppButtonView(text: "Go!", color: .appGreen)
            }
            .padding()
        }
        .alert("Fill days", isPresented: $isShowingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("You need to fill each field with at least 1 favorite day.")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
