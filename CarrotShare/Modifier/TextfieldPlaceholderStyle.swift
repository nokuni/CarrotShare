//
//  TextfieldPlaceholderStyle.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

public struct PlaceholderModifier<T: View>: ViewModifier {
    var isPlaceholderShowing: Bool
    var placeholder: T
    init(isPlaceholderShowing: Bool, @ViewBuilder placeholder: () -> T) {
        self.isPlaceholderShowing = isPlaceholderShowing
        self.placeholder = placeholder()
    }
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if isPlaceholderShowing {
                placeholder
            }
            content
            .foregroundColor(Color.primary)
        }
    }
}
