//
//  CarrotTradeView.swift
//  CarrotShare
//
//  Created by N N on 02/12/2022.
//

import SwiftUI

struct CarrotTradeView: View {
    @State private var showingSheet = false
    @State private var showingTrade = false
    @State private var selectedRule: Rule?
   
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
                    
                    ForEach(Rule.rules, id: \.id) { rule in
                        TradeView(rule: rule, selectedRule: $selectedRule, showingTrade: $showingTrade)
                    }
                    
                    Button("Want to know more about carrot trade?") {
                        showingSheet.toggle()
                    }
                    .foregroundColor(.accentColor)
                    .sheet(isPresented: $showingSheet) {
                        RulesView()
                    }
                    .sheet(isPresented: $showingTrade) {
                        ChooseRewardView(selectedRule: $selectedRule, showingSheet: $showingTrade)
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
    @Binding var selectedRule: Rule?
    @Binding var showingTrade: Bool
    
    var body: some View {
        HStack {
            Text("\(rule.text) \(rule.amount) 🥕")
            Spacer()
            Button {
                selectedRule = rule
                showingTrade.toggle()
            } label: {
                SmallButtonView(text: "Go!", color: Color("AppGreen"))
            }
        }
        .font(.title2)
        .padding()
    }
}
