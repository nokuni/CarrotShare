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
    private let userImages = ["joe", "nat", "yannc", "christophe"]
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    ScrollView {
                        LinearGradient(colors: [.appOrange, .appGreen], startPoint: .bottom, endPoint: .top)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3, alignment: .bottom)
                            .overlay(
                                GeometryReader { geo in
                                    VStack {
                                        Text("Carrot Trade")
                                            .fontWeight(.bold)
                                            .font(.system(size: UIScreen.main.bounds.height * 0.06))
                                            .foregroundColor(Color(UIColor.systemBackground))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        HStack {
                                            ForEach(userImages, id: \.self) { image in
                                                Image(image)
                                                    .resizable()
                                                    .scaledToFit()
                                            }
                                        }
                                    }
                                    .padding(.top, 50)
                                    .padding(.horizontal)
                                }
                            )
                        ZStack {
                            Color.white
                            VStack {
                                ForEach(Rule.rules, id: \.id) { rule in
                                    TradeView(rule: rule, selectedRule: $selectedRule, showingTrade: $showingTrade)
                                }
                                
                                Button("Want to know more about carrot trade?") {
                                    showingSheet.toggle()
                                }
                                .padding(.bottom)
                                .foregroundColor(.accentColor)
                                .sheet(isPresented: $showingSheet) {
                                    RulesView()
                                }
                                .sheet(isPresented: $showingTrade) {
                                    ChooseRewardView(selectedRule: $selectedRule, showingSheet: $showingTrade)
                                }
                            }
                        }
                    }
                    .ignoresSafeArea()
                }
            }
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
