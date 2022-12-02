//
//  CustomMultiDatePickerView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct CustomMultiDatePickerView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(.white)
            .shadow(color: .gray, radius: 10)
            .overlay(
                VStack(alignment: .leading) {
                    Text(Date.currentMonth.capitalized)
                        .fontWeight(.semibold)
                        .font(.body)
                        .padding()
                    DaysListView()
                    
                    MultiDatePickerGridView()
                }
            )
            .padding()
    }
}

struct CustomMultiDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMultiDatePickerView()
            .environmentObject(CarrotShareViewModel())
    }
}
