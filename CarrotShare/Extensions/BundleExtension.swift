//
//  BundleExtension.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import Foundation

extension Bundle {
     var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
