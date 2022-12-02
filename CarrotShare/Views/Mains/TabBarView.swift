//
//  TabBarView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct TabBarView: View {
    @State var selection: Int = 2
    var body: some View {
        TabView(selection: $selection) {
            ChoresView()
                .tabItem {
                    Image(systemName: "wand.and.stars.inverse")
                    Text("Chores")
                }
                .tag(0)
            CarrotTradeView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Carrot Trade")
                }
                .tag(1)
            FlatmatesView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Flatmates")
                }
                .tag(2)
            LetsPlayView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Let's Play")
                }
                .tag(3)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(CarrotShareViewModel())
    }
}
