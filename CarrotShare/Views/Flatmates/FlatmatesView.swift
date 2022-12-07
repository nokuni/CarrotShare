//
//  FlatmatesView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct FlatmatesView: View {
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    var body: some View {
        NavigationView {
            if let _ = carrotShareVM.flatshareResponse {
                FlatmateListView()
                    .navigationTitle("Flatmates")
            } else {
                FlatshareView()
            }
        }
    }
}

struct FlatmatesView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmatesView()
            .environmentObject(CarrotShareViewModel())
    }
}
