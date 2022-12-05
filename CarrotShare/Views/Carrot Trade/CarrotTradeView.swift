//
//  CarrotTradeView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct CarrotTradeView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Image("banner")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .ignoresSafeArea()
                    
                    ForEach(rules, id: \.id) { rule in
                        TradeView(rule: rule)
                    }
                    
                    Button("Want to know more about carrot trade?") {
                        showingSheet.toggle()
                    }
                    .padding(.bottom)
                    .foregroundColor(.accentColor)
                    .sheet(isPresented: $showingSheet) {
                        RulesView()
                    }
                }
            }
            .navigationBarTitle("Carrot trade")
        }
    }
}

struct CarrotTradeView_Previews: PreviewProvider {
    static var previews: some View {
        CarrotTradeView()
    }
}

struct TradeView: View {
    var rule: Rule
    
    var body: some View {
        VStack {
            HStack {
                Text("\(rule.text) \(rule.amount) 🥕")
                Spacer()
                SmallButtonView(text: "Go!", color: Color("AppGreen"))
            }
            .font(.title2)
            .padding()
            Divider()
        }
    }
}
