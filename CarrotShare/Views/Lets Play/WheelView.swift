//
//  WheelView.swift
//  CarrotShare
//
<<<<<<< HEAD
//  Created by Jonathan Duong on 05/12/2022.
=======
//  Created by CHRISTOPHE LEHOUSSINE on 02/12/2022.
>>>>>>> refs/remotes/origin/main
//

import SwiftUI

struct WheelView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
         
                Color.appGreen.edgesIgnoringSafeArea(.all)
            VStack {
                Button("Retour") {
                    dismiss()
                }.padding(30)
                
                Text("Whose the Chef today?")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                // wheel + Button
                
                
                HStack {
                    Image("christophe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        .shadow(radius: 4)
                    Image("joe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        .padding(.horizontal)
                        .shadow(radius: 4)
                    Image("nat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        .padding(.trailing)
                        .shadow(radius: 4)
                    Image("yannc")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        .shadow(radius: 3)
            
                }
            
            }
        }
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView()
    }
}
