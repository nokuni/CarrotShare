//
//  ChooseRewardView.swift
//  CarrotShare
//
//  Created by N N on 05/12/2022.
//

import SwiftUI

struct ChooseRewardView: View {
    @State private var date = Date.now
    @State private var selectedChore: Chore = .dishes
    @State private var selectedFood: Food = .thai
    @State private var selectedMovie: Movie = .thriller
    @Binding var selectedRule: Rule?
    @Binding var showingSheet: Bool
    @Environment(\.presentationMode) var presentationMode
    
    enum Chore: String, CaseIterable, Identifiable {
        case dishes, kitchen, livingroom, rubbish, shopping, toilet
        case date = "Today"
        var id: Self { self }
    }
    
    enum Food: String, CaseIterable, Identifiable {
        case chinese, italian, japanese, mexican, thai, vegetarian
        case date = "Today"
        var id: Self { self }
    }
    
    enum Movie: String, CaseIterable, Identifiable {
        case action, comedy, drama, fantasy, horror, mystery, romance, thriller
        case date = "Today"
        var id: Self { self }
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color.accentColor
                    .ignoresSafeArea()
                VStack {
                    Capsule()
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.075)
                        .foregroundColor(.white)
                        .overlay(
                            HStack {
                                if let selectedRule = selectedRule {
                                    switch selectedRule.category {
                                    case .chore:
                                        Text("Select chore")
                                            .foregroundColor(.accentColor)
                                        Spacer()
                                        Picker("Select chore", selection: $selectedChore) {
                                            Text("Dishes").tag(Chore.dishes)
                                            Text("Kitchen").tag(Chore.kitchen)
                                            Text("Living-room").tag(Chore.livingroom)
                                            Text("Rubbish").tag(Chore.rubbish)
                                            Text("Shopping").tag(Chore.shopping)
                                            Text("Toilet").tag(Chore.toilet)
                                        }
                                        .tint(.primary)
                                        .pickerStyle(.automatic)
                                        .padding()
                                    case .menu:
                                        Text("Select food")
                                            .foregroundColor(.accentColor)
                                        Spacer()
                                        Picker("Select food", selection: $selectedFood) {
                                            Text("Chinese").tag(Food.chinese)
                                            Text("Italian").tag(Food.italian)
                                            Text("Japanese").tag(Food.japanese)
                                            Text("Mexican").tag(Food.mexican)
                                            Text("Thai").tag(Food.thai)
                                            Text("Vegetarian").tag(Food.vegetarian)
                                        }
                                        .tint(.primary)
                                        .pickerStyle(.automatic)
                                        .padding()
                                    case .movie:
                                        Text("Select movie")
                                            .foregroundColor(.accentColor)
                                        Spacer()
                                        Picker("Select movie", selection: $selectedMovie) {
                                            Text("Action").tag(Movie.action)
                                            Text("Comedy").tag(Movie.comedy)
                                            Text("Drama").tag(Movie.drama)
                                            Text("Fantasy").tag(Movie.fantasy)
                                            Text("Horror").tag(Movie.horror)
                                            Text("Mystery").tag(Movie.mystery)
                                            Text("Romance").tag(Movie.romance)
                                            Text("Thriller").tag(Movie.thriller)
                                        }
                                        .tint(.primary)
                                        .pickerStyle(.automatic)
                                        .padding()
                                    case .TV:
                                        Text("Book the TV for a whole evening")
                                            .foregroundColor(.accentColor)
                                        Spacer()
                                        Picker("Book the TV for a whole evening", selection: .constant(false)) {
                                        }
                                        .tint(.primary)
                                        .pickerStyle(.automatic)
                                        .padding()
                                    case .flatOneHour:
                                        Text("Book the flat to yourself for 1 hr")
                                            .foregroundColor(.accentColor)
                                        Spacer()
                                        Picker("Book the flat to yourself for 1 hr", selection: .constant(false)) {
                                        }
                                        .tint(.primary)
                                        .pickerStyle(.automatic)
                                        .padding()
                                    case .flatTwoHours:
                                        Text("Book the flat to yourself for 2 hrs")
                                            .foregroundColor(.accentColor)
                                        Spacer()
                                        Picker("Book the flat to yourself for 2 hrs", selection: .constant(false)) {
                                        }
                                        .tint(.primary)
                                        .pickerStyle(.automatic)
                                        .padding()
                                    }
                                }
                            }
                                .padding(.horizontal)
                        )
                        .padding()
                    
                    VStack {
                        DatePicker(selection: $date, in: Date.now..., displayedComponents: .date) {
                            Text("Select a date")
                                .foregroundColor(.accentColor)
                                .padding(20)
                        }
                        .background(.white)
                        .clipShape(Capsule())
                        
                        Text("You selected: \(date.formatted(date: .long, time: .omitted))")
                            .padding(.bottom, 30)
                        
                        Button {
                            print("Trade done!")
                        } label: {
                            Text("Continue")
                                .padding(20)
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .background(Color("AppGreen"))
                        .clipShape(Capsule())
                    }
                    .padding()
                    Spacer()
                }
                
            }
            .navigationBarTitle("Trade carrots", displayMode: .inline)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color("AppGreen"))
                }
            }
        }
    }
}

struct ChooseRewardView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseRewardView(selectedRule: .constant(Rule.rules[2]), showingSheet: .constant(false))
        //        .constant : valeur du binding sera tjrs la meme
    }
}

