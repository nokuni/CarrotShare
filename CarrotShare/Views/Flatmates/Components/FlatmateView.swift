//
//  FlatmateView.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import SwiftUI

struct FlatmateView: View {
    
    var user: User
    
    var body: some View {
        HStack {
            if let image = user.image {
                Image(image)
                    .resizable()
                    .frame(width: 120, height: 120)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                if let username = user.username {
                    Text(username)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 6)
                }
                if let carrotWallet = user.carrotWallet {
                    Text("\(carrotWallet) 🥕")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                if let trophy = user.trophy {
                    Text("\(trophy) 🏆")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
    }
}

struct FlatmateView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmateView(user: .mock())
    }
}
