//
//  FlatmateListView.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import SwiftUI

struct FlatmateListView: View {
    
    @EnvironmentObject var carrotShareVM: CarrotShareViewModel
    var filteredUsers: [User] {
        carrotShareVM.users?.filter {
            $0.id != carrotShareVM.user?.id
        } ?? []
    }
    
    var body: some View {
        ZStack {
            if let _ = carrotShareVM.users {
                List(filteredUsers) { user in
                    NavigationLink(destination: FlatmateDetailView(user: user)) {
                        FlatmateView(user: user)
                    }
                }

            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if let user = carrotShareVM.user {
                    NavigationLink {
                        FlatmateDetailView(user: user)
                    } label: {
                        Image(user.image ?? "")
                    }
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("AppGreen"))
                }
            }
        }
    }
}

struct FlatmateListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlatmateListView()
                .environmentObject(CarrotShareViewModel())
        }
    }
}
