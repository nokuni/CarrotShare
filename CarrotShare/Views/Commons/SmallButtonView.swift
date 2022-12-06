//
//  SmallButtonView.swift
//  CarrotShare
//
//  Created by N N on 02/12/2022.
//

import SwiftUI

struct SmallButtonView: View {
    
    var text: String
    var color: Color
    
    var body: some View {
        Capsule()
            .foregroundColor(color)
            .frame(width: UIScreen.main.bounds.width * 0.24, height: UIScreen.main.bounds.height * 0.04)
            .overlay(
                Text(text)
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundColor(Color(UIColor.systemBackground))
            )
    }
}

struct SmallButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SmallButtonView(text: "Go!", color: .appGreen)
    }
}
