//
//  ChoresCollectionView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

struct ChoresCollectionView: View {
    var grid = [GridItem](repeating: .init(.flexible(), alignment: .leading), count: 2)
    var body: some View {
        LazyVGrid(columns: grid) {
            ForEach(Chore.all) { chore in
                HStack {
                    Circle()
                        .foregroundColor(chore.color)
                        .frame(width: UIScreen.main.bounds.height * 0.05, height: UIScreen.main.bounds.height * 0.05)
                        .opacity(0.3)
                    Text(chore.description)
                        .font(.callout)
                }
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
