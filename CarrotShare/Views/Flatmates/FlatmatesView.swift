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
            FlatmatesListView()
                .navigationTitle("Flatmates")
        }
    }
}

struct FlatmatesView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmatesView()
            .environmentObject(CarrotShareViewModel())
    }
}
