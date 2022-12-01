//
//  FlatmateView.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import SwiftUI

struct FlatmateView: View {
    @State var flatmate: Flatmate
    
    var body: some View {
        HStack {
            Image(flatmate.imageName)
                .resizable()
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(flatmate.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 6)
                Text("\(flatmate.carrotNumber) 🥕")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("\(flatmate.trophyNumber) 🏆")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

struct FlatmateView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmateView(flatmate: Flatmate(name: "Christophe", imageName: "christophe", carrotNumber: 7, trophyNumber: 1))
    }
}
