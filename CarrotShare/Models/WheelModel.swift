//
//  WheelModel.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 07/12/2022.
//

import Foundation

struct WheelModel: Codable {
    var flatshareId: Int
    var updatedAt: String
}

extension Date {
    static func isToday(towardsTo date: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDateInToday(date)
    }
}
