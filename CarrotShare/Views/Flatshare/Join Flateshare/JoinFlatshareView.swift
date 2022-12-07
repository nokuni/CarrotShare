//
//  JoinFlatshareView.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 05/12/2022.
//

import SwiftUI

struct JoinFlatshareView: View {
    
    @ObservedObject var carrotShareVM: CarrotShareViewModel
    @State var searchText: String = ""
    @State var selectedFlatshare: Flatshare?
    @Binding var isCreateView: Bool
    @Binding var isShowingAlert: Bool
    @Binding var code: String
    @Binding var textInput: String
    

    var body: some View {
        ScrollView {
            VStack {
                if let flatshares = carrotShareVM.flatshares {
                    ForEach(flatshares) { flatshare in
                        FlateshareCellView(flatshare: flatshare, selectedFlatshare: $selectedFlatshare, showAlert: $isShowingAlert, textInput: $textInput)
                    }
                }
            }
            .task {
                do {
                    carrotShareVM.flatshares = try await carrotShareVM.getFlatshares()
                } catch {
                    print(error)
                }
            }
            .alert("Join group", isPresented: $isShowingAlert) {
                TextField("Code", text: $textInput)
                Button("Cancel", role: .cancel) {}
                Button {
                    
                        
                            carrotShareVM.flatshareResponse = FlatshareResponse(code: "111", userId: 1)
                        
                    
                } label: {
                    Text("Join")
                }
            } message: {
                if let name = selectedFlatshare?.name {
                    Text("Enter the code to join \(name)")
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Flatshare List")
        }
    }
}

struct JoinFlatshareView_Previews: PreviewProvider {
    static var previews: some View {
        JoinFlatshareView(carrotShareVM: CarrotShareViewModel(), isCreateView: .constant(false), isShowingAlert: .constant(false), code: .constant(""), textInput: .constant(""))
    }
}
