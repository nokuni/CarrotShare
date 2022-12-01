//
//  SettingsButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

struct SettingsButtonView: View {
    var text: String
    var body: some View {
        
        Button(action: {
            
        }) {
            Capsule()
                .foregroundColor(Color(UIColor.systemGray5))
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.07)
                .overlay(
                    Text(text)
                        .fontWeight(.semibold)
                        .font(.title3)
                        .foregroundColor(Color(UIColor.systemBackground))
                )
        }
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView(text: "")
    }
}
