//
//  OnBoardingView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct OnBoardingView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    var body: some View {
        NavigationView {
            switch true {
            case carrotShareVM.isApplyingSettings:
                SettingsView()
            case carrotShareVM.isLoggedIn:
                TabBarView()
            default:
                LoginView()
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
