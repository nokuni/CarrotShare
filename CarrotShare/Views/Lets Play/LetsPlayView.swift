import SwiftUI

struct LetsPlayView: View {
    @State private var showingSheet = false
    //  var user: User
    var body: some View {
        NavigationView{
            ScrollView {
                
                Button {
                    showingSheet.toggle()
                } label: {
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.appOrange)
                            .frame(width: 340, height: 180)
                            .cornerRadius(30)
                        
                        HStack {
                            Image("spin-wheel")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(height: 170)
                                .padding(30)
                            
                            VStack {
                                Image("chef")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .padding(.trailing, 29.0)
                                    .frame(height: 70)
                                
                                Text("Chef of \nThe day ?")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .lineLimit(2)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 40.0)
                            }
                        }
                        
                    }
                } .sheet(isPresented: $showingSheet) {
                    // Ajouter
//                    ResultWheelView()
                    WheelView(wheel: Wheel())
                }
                HStack {
                    
                    Text("My Trophies")
                        .padding(15)
                        .font(.title3)
                    Spacer()
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.appGreen)
                        .frame(width: 340, height: 340)
                        .cornerRadius(30)
                    VStack{
                        HStack{
                            
                            Image("cup")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .overlay(alignment: .top){
                                    Image("cooking")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                        .padding()
                                }
                            Image("cup")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .padding(.horizontal)
                                .overlay(alignment: .top){
                                    Image("dishwashing")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 35)
                                        .padding(10)
                                }
                            Image("cup")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .opacity(0.3)
                                .overlay(alignment: .top){
                                    Image("bucket")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                        .padding()
                                        .opacity(0.7)
                                }
                        }.padding(30)
                        HStack{
                            Image("cup")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .opacity(0.3)
                                .overlay(alignment: .top){
                                    Image("broom")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                        .padding()
                                        .opacity(0.3)
                                }
                            Image("cup")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .padding(.horizontal)
                                .opacity(0.3)
                                .overlay(alignment: .top){
                                    Image("toilet")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 35)
                                        .padding()
                                        .opacity(0.3)
                                }
                            Image("cup")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .opacity(0.3)
                                .overlay(alignment: .top){
                                    Image("shop")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                        .padding()
                                        .opacity(0.3)
                                }
                        }.padding(30)
                    }
                }
            HStack{
                Text("Roomate Ranking")
                    .padding(15)
                    .font(.title3)
                Spacer()
            }
            HStack{
                Image("yannc")
                    
                    Image("nat")
                        .padding([.leading, .bottom, .trailing], 28 )
                    Image("joe")
                }
                Image("podium")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .padding(.top, -40)
            }
        }
    }
}

struct LetsPlayView_Previews: PreviewProvider {
    static var previews: some View {
        LetsPlayView()
    }
}
