//
//  FlatmateDetailView.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import SwiftUI

struct FlatmateDetailView: View {
    
    var user: User
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            FlatmateHeaderView(user: user)
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
        FlatmateDetailView(user: .mock())
    }
}

struct FlatmateHeaderView: View {
    
    var user: User
    
    var body: some View {
        HStack {
            if let image = user.image {
                Image(image)
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                if let username = user.username {
                    Text(username)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom, 6)
                }
                if let carrotWallet = user.carrotWallet {
                    Text("\(carrotWallet) 🥕")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                if let trophy = user.trophy {
                    Text("\(trophy) 🏆")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
    }
}
