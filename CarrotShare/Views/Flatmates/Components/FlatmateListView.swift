//
//  FlatmateListView.swift
//  CarrotShare
//
//  Created by N N on 01/12/2022.
//

import SwiftUI

struct FlatmateListView: View {
    
    @StateObject var carrotShareVM = CarrotShareViewModel()
    
    var body: some View {
        ZStack {
            if let users = carrotShareVM.users {
                List(users) { user in
                    NavigationLink(destination: FlatmateDetailView(user: user)) {
                        FlatmateView(user: user)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Do something...
                        }, label: {
                            if let image = carrotShareVM.user?.image {
                                Image(image)
                            }
                        })
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color("AppGreen"))
                    }
                }
            }
        }
        .task {
            do {
                carrotShareVM.users = try await carrotShareVM.getUsers()
            } catch {
                print(error)
            }
        }
    }
}

struct FlatmateListView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmateListView()
            .environmentObject(CarrotShareViewModel())
    }
}
