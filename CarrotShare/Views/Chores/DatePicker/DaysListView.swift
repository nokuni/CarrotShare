//
//  DaysListView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

struct DaysListView: View {
    private let week = Date.week
    var body: some View {
        HStack {
            ForEach(week, id: \.self) { week in
                Text(week.prefix(3).uppercased())
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 20)
    }
}

struct DaysListView_Previews: PreviewProvider {
    static var previews: some View {
        DaysListView()
    }
}
