//
//  LoginTitleView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct LoginTitleView: View {
    private var appNameSeparated: [String] {
        let appName = Bundle.main.displayName!
        let result = appName.components(separatedBy: " ")
        return result
    }
    var body: some View {
        LinearGradient(
            colors: [.appGreen, .appOrange],
            startPoint: .leading,
            endPoint: .trailing
        )
        .frame(width: UIScreen.main.bounds.height * 0.3, height: UIScreen.main.bounds.height * 0.2)
        .mask(
            VStack(spacing: -30) {
                
                Text(appNameSeparated.first!)
                    .font(.system(size: UIScreen.main.bounds.height * 0.07, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                Text(appNameSeparated.last!)
                    .font(.system(size: UIScreen.main.bounds.height * 0.07, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
            }
        )
        .padding(.top, 30)
    }
}

struct LoginTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTitleView()
    }
}
