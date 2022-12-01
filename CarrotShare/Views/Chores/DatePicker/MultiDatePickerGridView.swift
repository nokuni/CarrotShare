//
//  MultiDatePickerGridView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

struct MultiDatePickerGridView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    var grid = [GridItem](repeating: .init(.flexible(), spacing: 20, alignment: .leading), count: 7)
    private let days = Date.currentMonthDays + Date.startingDaysOff
    var body: some View {
        LazyVGrid(columns: grid, spacing: 25) {
            ForEach(1..<days, id: \.self) { index in
                if let chore = carrotShareVM.getChore(from: index) {
                    NavigationLink(destination: Text("\(chore.user.name)")) {
                        DateNumberElementView(index: index)
                    }
                } else {
                    Button(action: {
                        
                    }) {
                        DateNumberElementView(index: index)
                    }
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            print(Date.startingDaysOff)
        }
    }
}

struct MultiDatePickerGridView_Previews: PreviewProvider {
    static var previews: some View {
        MultiDatePickerGridView()
    }
}
