//
//  FlatmatesListView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct FlatmatesListView: View {
    var body: some View {
        VStack(spacing: 25) {
            
            Text("You don't have any group !")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                
            }) {
                AppButtonView(text: "Join a group", color: .appGreen)
            }
            
            Button(action: {
                
            }) {
                AppButtonView(text: "Create a group", color: .appOrange)
            }
        }
    }
}

struct FlatmatesListView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmatesListView()
    }
}
