//
//  ChoresCollectionView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

import SwiftUI

struct ChoresCollectionView: View {
    
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    var grid = [GridItem](repeating: .init(.flexible(), alignment: .leading), count: 2)
    
    var body: some View {
        LazyVGrid(columns: grid) {
            ForEach(carrotShareVM.chores) { chore in
                HStack {
                    Circle()
                        .foregroundColor(chore.category.color)
                        .frame(width: UIScreen.main.bounds.height * 0.05, height: UIScreen.main.bounds.height * 0.05)
                        .opacity(0.3)
                    Text(chore.content)
                        .font(.callout)
                }
            }
        }
        .task {
            do {
                carrotShareVM.chores = try await carrotShareVM.fetchChores()
            } catch {
                print(error)
            }
        }
        .padding()
    }
}

struct ChoresCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ChoresCollectionView()
    }
}
