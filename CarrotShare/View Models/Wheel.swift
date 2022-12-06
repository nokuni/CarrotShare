//
//  Wheel.swift
//  CarrotShare
//
//  Created by CHRISTOPHE LEHOUSSINE on 05/12/2022.
//

import SwiftUI

class Wheel: ObservableObject {
    
    static let shared = Wheel()
    
    struct WheelElement: Identifiable {
        var id = UUID()
        var offset: CGSize = .zero
        var frame: (CGFloat, CGFloat, Alignment)
        var userImage: String
    }
    
    var nameWon: String = "Try Again"
    
    @Published var degree: Double = 0
    @Published var elements: [WheelElement] = [
        WheelElement(frame: (UIScreen.main.bounds.width * 0.40, UIScreen.main.bounds.height * 0.35, .topLeading), userImage: "joe"),
        WheelElement(frame: (UIScreen.main.bounds.width * 0.40, UIScreen.main.bounds.height * 0.35, .topTrailing), userImage: "nat"),
        WheelElement(frame: (UIScreen.main.bounds.width * 0.7, UIScreen.main.bounds.height * 0.18, .topTrailing) , userImage: "christophe"),
        WheelElement(frame: (UIScreen.main.bounds.width * 0.7, UIScreen.main.bounds.height * 0.18, .bottomTrailing), userImage: "yannc"),
        WheelElement(frame: (UIScreen.main.bounds.width * 0.40, UIScreen.main.bounds.height * 0.35, .bottomTrailing), userImage: "joe"),
        WheelElement(frame: (UIScreen.main.bounds.width * 0.40, UIScreen.main.bounds.height * 0.35, .bottomLeading), userImage: "nat"),
        WheelElement(frame: (UIScreen.main.bounds.width * 0.7, UIScreen.main.bounds.height * 0.18, .bottomLeading), userImage: "christophe"),
        WheelElement(frame: (UIScreen.main.bounds.width * 0.7, UIScreen.main.bounds.height * 0.18, .topLeading), userImage: "yannc")
        
    ]
    @Published var isRotating: Bool = false
    
    var timer: Timer?
    var duration: TimeInterval = [20, 25, 24, 30, 21, 29, 22, 39].randomElement()!
    
    var chefName: String {
        switch duration {
        case 20:
            return "Joe"
        case 25:
            return "Christophe"
        case 24:
            return "Yann C"
        case 30:
            return "Joe"
        case 21:
            return "Yann C"
        case 29:
            return "Nathalie"
        case 22:
            return "Christophe"
        case 39:
            return "Nathalie"
            
        default:
            return "Try again"
        }
    }
    
    var actionAfter: (() -> Void)?
    
    func start() {
        nameWon = chefName
        isRotating = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.countDown(timer: timer, durationCount: self.duration)
        }
    }
    
    func reset() {
        degree = 0
        elements = Wheel.shared.elements
        isRotating = false
    }
    
    private var isCountDownCompleted: Bool { duration == 0 }
    private func cancelTimer(_ timer: Timer) { timer.invalidate() }
    private func countDown(timer: Timer, durationCount: TimeInterval) {
        if duration > 0 {
            duration -= 1
            rotate()
            if isCountDownCompleted {
                isRotating = false
                cancelTimer(timer)
                print(nameWon)
                actionAfter?()
            }
        }
    }
    
    func rotate() {
        withAnimation { degree += 55 }
    }
}
