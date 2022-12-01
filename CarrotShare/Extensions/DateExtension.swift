//
//  DateExtension.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import Foundation

extension Date {
    
    static var currentMonthNumber: Int {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        return Int(formatter.string(from: date))!
    }
    
    static var currentYearNumber: Int {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return Int(formatter.string(from: date))!
    }
    
    static var currentMonth: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    static var week: [String] {
        var days: [String] = []

        for dayNumber in 3..<10 {
            let dateComponents = DateComponents(day: dayNumber)
            let calendar = Calendar.current
            let date = calendar.date(from: dateComponents)!
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayName: String = dateFormatter.string(from: date)
            print(dayName)
            days.append(dayName)
        }
        
        return days
    }
    
    static var getFirstDayOfTheMonth: String {
        let dateComponents = DateComponents(year: 2022, month: 12, day: 1)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"

        let dayName: String = dateFormatter.string(from: date)
        return dayName
    }
    
    static var startingDaysOff: Int {
        switch getFirstDayOfTheMonth {
        case week[1]:
            return 1
        case week[2]:
            return 2
        case week[3]:
            return 3
        case week[4]:
            return 4
        case week[5]:
            return 5
        case week[6]:
            return 6
        default:
            return 0
        }
    }
    
    static var currentMonthDays: Int {
        let dateComponents = DateComponents(year: currentYearNumber, month: currentMonthNumber)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        return numDays
    }
}
