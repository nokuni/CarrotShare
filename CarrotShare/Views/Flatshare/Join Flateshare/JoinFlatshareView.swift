//
//  JoinFlatshareView.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 05/12/2022.
//

import SwiftUI

struct JoinFlatshareView: View {
    @StateObject var carrotShareVM = CarrotShareViewModel()
    @State var isCreateView: Bool = false
    @State private var isShowingAlert: Bool = false
    @State private var name: String = ""
    @State private var personCount: String = ""
    @State private var roomCount: String = ""
    @State private var code: String = ""
    @State private var searchText: String = ""
    @State private var textInput: String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(carrotShareVM.flatshares ?? [], id: \.self) { group in
                        FlateshareCellView(carrotShareVM: carrotShareVM, flatshare: group, showAlert: $isShowingAlert, textInput: $textInput)
                        }
                    
                    Button(action: {
                        isCreateView.toggle()
                    }) {
                        TransparentAppButtonView(text: "Create flateshare", size: CGSize(width: UIScreen.main.bounds.width * 0.50, height: UIScreen.main.bounds.height * 0.07))
                    }
                    .padding(.top)
                    .sheet(isPresented: $isCreateView) {
                        CreateFlatshareView(isShowingAlert: $isShowingAlert, name: $name, personCount: $personCount, roomCount: $roomCount, code: $code)
                    }
                }
                .task {
                    do {
                        carrotShareVM.flatshares = try await carrotShareVM.fetchFlatshares()
                    } catch {
                        print(error)
                    }
                }
                .searchable(text: $searchText)
            .navigationTitle("Flatshare List")
            }
        }
    }
}

struct JoinFlatshareView_Previews: PreviewProvider {
    static var previews: some View {
        JoinFlatshareView()
    }
}



 struct FlateshareCellView: View {
     
     @ObservedObject var carrotShareVM: CarrotShareViewModel
     var flatshare: Flatshare
     @Binding var showAlert: Bool
     @Binding var textInput: String
     var body: some View {
         VStack {
             HStack {
                 if let name = flatshare.name {
                     Text(name)
                 }
                 Spacer()
                 Button {
                     showAlert.toggle()
                 } label: {
                     SmallButtonView(text: "Join", color: Color("AppGreen"))
                 }
                 .alert("Join group", isPresented: $showAlert) {
                     TextField("Code", text: $textInput)
                     Button("OK", action: text)
                 } message: {
                     if let name = flatshare.name {
                         Text("Enter the code to join \(name)")
                     }
                 }
             }
             .font(.title2)
             .padding()
             Divider()
         }
     }
     func text() {
         
     }
 }
 
