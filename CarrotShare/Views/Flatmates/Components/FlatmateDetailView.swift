//
//  FlatmateDetailView.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import SwiftUI

struct FlatmateDetailView: View {
    @State var flatmate: Flatmate
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            FlatmateHeaderView(flatmate: flatmate)
            Divider()
            
            VStack(alignment: .leading) {
                Text("Anything to do today?")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(40)
                HStack {
                    Text("Hover and mop the bathroom")
                        .font(.title3)
                    Spacer()
                    Button("Done?") {
                        showingAlert = true
                    }
                    .alert("Confirm it's done", isPresented: $showingAlert) {
                        Button("OK", role: .destructive) { }
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct FlatmateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmateDetailView(flatmate: Flatmate(name: "Christophe", imageName: "christophe", carrotNumber: 7, trophyNumber: 1))
    }
}

struct FlatmateHeaderView: View {
    @State var flatmate: Flatmate
    
    var body: some View {
        HStack {
            Image(flatmate.imageName)
                .resizable()
                .frame(width: 150, height: 150)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(flatmate.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 6)
                Text("\(flatmate.carrotNumber) 🥕")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("\(flatmate.trophyNumber) 🏆")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}
