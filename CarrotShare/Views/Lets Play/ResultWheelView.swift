//
//  ResultWheelView.swift
//  CarrotShare
//
<<<<<<< HEAD
//  Created by Jonathan Duong on 05/12/2022.
=======
//  Created by CHRISTOPHE LEHOUSSINE on 02/12/2022.
>>>>>>> refs/remotes/origin/main
//

import SwiftUI

struct ResultWheelView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            
            Color.appGreen.edgesIgnoringSafeArea(.all)
            VStack {
                Button("Return") {
                    dismiss()
                }.padding(30)
                
                Text("Whose the Chef today?")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.vertical, 30)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 340, height: 180)
                        .cornerRadius(15)
                        .shadow(radius:4, y: 3)
                        .overlay (alignment: .top) {
                            ZStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.appOrange)
                                    .font(.system(size: 120))
                                    .shadow(radius: 4)
                                
                                Text("Today")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .frame(maxHeight: UIScreen.main.bounds.width * 0)
                        }
                    // Mettre ici le resultat de la roue
                    Text("Nathalie")
                        .font(.largeTitle)
                }
                Text("Tired of chores !")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.vertical, 30)
                HStack{
                    Text("Select one rommate to \nswap your carrots with")
                        .font(.title2)
                        .foregroundColor(.white)
                    //.padding(30)
                    
                    Image("carrot-icon-white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .padding(.trailing, -20)
                    Image("carrot-icon-white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    
                }
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
<<<<<<< HEAD
                    
                }
                
=======
            
                }
            
>>>>>>> refs/remotes/origin/main
            }
        }
    }
}
<<<<<<< HEAD

struct ResultWheelView_Previews: PreviewProvider {
    static var previews: some View {
        ResultWheelView()
    }
}
=======
    struct ResultWheelView_Previews: PreviewProvider {
        static var previews: some View {
            ResultWheelView()
        }
    }
>>>>>>> refs/remotes/origin/main
