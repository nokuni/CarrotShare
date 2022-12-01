//
//  SettingsView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }) {
                TransparentAppButtonView(text: "Upload your picture")
            }
            
            Button(action: {
                
            }) {
                AppButtonView(text: "Go!", color: .appGreen)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
