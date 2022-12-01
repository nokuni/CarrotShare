//
//  ChoresView.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

struct ChoresView: View {
    var body: some View {
        NavigationView {
            VStack {
                CustomMultiDatePickerView()
                ChoresCollectionView()
            }
        }
    }
}

struct ChoresView_Previews: PreviewProvider {
    static var previews: some View {
        ChoresView()
    }
}
