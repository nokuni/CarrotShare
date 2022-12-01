//
//  SettingsButtonView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 01/12/22.
//

import SwiftUI

struct SettingsButtonView: View {
    var grid = [GridItem](repeating: .init(.flexible(), spacing: 20, alignment: .leading), count: 3)
    var header: String
    @Binding var days: String
    var filteredDays: [String] {
        let filteredWeek = Date.week.filter { string in
            let daysArray = days.components(separatedBy: ", ")
            return !daysArray.contains(string)
        }
        return filteredWeek
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(header.uppercased())
                .fontWeight(.bold)
                .font(.caption)
                .foregroundColor(.secondary)
            Menu {
                ForEach(filteredDays, id: \.self) { day in
                    Button(action: {
                        if filteredDays.count == 1 {
                            days += "\(day)"
                        } else {
                            days += "\(day), "
                        }
                    }) {
                        Text(day)
                    }
                }
            } label: {
                Capsule()
                    .foregroundColor(Color(UIColor.systemGray5))
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.07)
                    .overlay(
                        Text(days)
                            .fontWeight(.semibold)
                            .font(.callout)
                            .foregroundColor(.primary)
                    )
            }
        }
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView(header: "", days: .constant(""))
    }
}
