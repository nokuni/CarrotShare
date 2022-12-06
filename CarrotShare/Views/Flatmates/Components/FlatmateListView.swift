//
//  FlatmateListView.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import SwiftUI

struct FlatmateListView: View {
    @State var flatmate: Flatmate
    
    var body: some View {
        NavigationView {
            List(Flatmate.default) { flatmate in
                NavigationLink(destination: FlatmateDetailView(flatmate: flatmate)) {
                    FlatmateView(flatmate: flatmate)
                }
            }
            .navigationTitle("Flatmates")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Do something...
                    }, label: {
                        Image(flatmate.imageName)
                    })
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("AppGreen"))
                }
            }
        }
    }
}

struct FlatmateListView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmateListView(flatmate:  Flatmate(name: "Christophe", imageName: "christophe", carrotNumber: 7, trophyNumber: 1))
    }
}
