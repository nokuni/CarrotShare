//
//  CarrotTradeRulesView.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import SwiftUI

struct RulesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("Carrots")
                        .font(.title2)
                        .padding(.bottom, 4)
                    VStack(alignment: .leading) {
                        Text("You earn 2 🥕 for every chore you complete")
                            .padding(.bottom, 4)
                        Text("If you skip your chore, you lose 2 🥕")
                    }
                }
                .padding()
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Rewards")
                        .font(.title2)
                        .padding(.bottom, 4)
                    VStack(alignment: .leading) {
                        Text("You can choose the menu for 10 🥕")
                            .padding(.bottom, 4)
                        Text("You can choose the movie for 10 🥕")
                            .padding(.bottom, 4)
                        Text("You can have the flat to yourself for 1 hour for 25 🥕")
                            .padding(.bottom, 4)
                        Text("And you can have the flat to yourself for 2 hours for 50 🥕")
                    }
                }
                .padding()
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Trophies")
                        .font(.title2)
                        .padding(.bottom, 4)
                    VStack(alignment: .leading) {
                        Text("You win a 🏆 after getting 10 🥕 in one chore")
                            .padding(.bottom, 4)
                        Text("The more 🏆🏆🏆 you get, the more you become the perfect flatmate!")
                    }
                }
                .padding()
                Divider()
            }
            .navigationBarTitle("Carrot trade rules", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color("AppGreen"))
                }
            }
        }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
