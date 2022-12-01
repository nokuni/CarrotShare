//
//  DateNumberElementView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

struct DateNumberElementView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    var index: Int
    var body: some View {
        ZStack {
            if (index - (Date.startingDaysOff - 1)) > 0 {
                Text("\(index - (Date.startingDaysOff - 1))")
                    .font(.title3)
                    .foregroundColor(.black)
                    .background(
                        ZStack {
                            if let chore = carrotShareVM.getChore(from: index) {
                                Circle()
                                    .foregroundColor(chore.color)
                                    .frame(width: UIScreen.main.bounds.height * 0.06, height: UIScreen.main.bounds.height * 0.06)
                                    .opacity(0.2)
                            }
                        }
                    )
                    .frame(width: UIScreen.main.bounds.height * 0.04, height: UIScreen.main.bounds.height * 0.04)
            }
        }
    }
}

struct DateNumberElementView_Previews: PreviewProvider {
    static var previews: some View {
        DateNumberElementView(index: 0)
    }
}
