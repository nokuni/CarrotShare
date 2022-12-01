//
//  ViewExtension.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

extension View {
    func placeholderStyle<T: View>(isPlaceholderShowing: Bool, content: () -> T) -> some View {
        modifier(PlaceholderModifier(isPlaceholderShowing: isPlaceholderShowing, placeholder: content))
    }
}
