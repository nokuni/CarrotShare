//
//  WheelView.swift
//  CarrotShare
//
//  Created by CHRISTOPHE LEHOUSSINE on 02/12/2022.
//

import SwiftUI

struct WheelView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var wheel: Wheel
    var body: some View {
        ZStack{
                Color.appGreen.edgesIgnoringSafeArea(.all)
            VStack {
                Button("Retour") {
                    dismiss()
                }.padding(30)
                
                Text("Who's the Chef today?")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                VStack {
                    ZStack {
                       
                        ZStack{
                            Circle()
                                .stroke(.orange, lineWidth: 15)
                                .background(WheelBackgroundView(wheel: wheel))
                                .rotationEffect(.degrees(wheel.degree))
                            Circle()
                                .stroke(.green, lineWidth: 3)
                                .background(WheelBackgroundView(wheel: wheel))
                                .rotationEffect(.degrees(wheel.degree))
                        }
                        .padding()
                        Image(systemName: "triangle.fill")
                            .font(.largeTitle)
                            .rotationEffect(.degrees(180))
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.47, alignment: .top)
                        }
                    
                    LaunchWheelButtonView(wheel: wheel)
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
            
                }
            
            }
        }
}
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView(wheel: Wheel())
    }
}

struct LineView: View {
    var angle: Angle?
    var body: some View {
        Rectangle()
            .frame(maxWidth: UIScreen.main.bounds.width * 0.005, maxHeight: UIScreen.main.bounds.height)
            .rotationEffect(angle ?? .zero)
    }
}
