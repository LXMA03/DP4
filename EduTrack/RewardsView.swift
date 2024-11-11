//
//  RewardsView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct RewardsView: View {
    @State private var showAlert = false
    @State private var selectedItem: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Rewards")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .padding(.top, 15)
                Text("Use your points to redeem real-life rewards!")
                    .font(.system(size: 14, design: .default))
                    .padding(.top, -10)
                        
                List {
                    Section(header: HStack {
                        Text("Redeem for")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.black)
                            .textCase(.none)
                        Text("10000")
                            .font(.custom("DS-Digital", size: 24))
                            .foregroundColor(.black)
                        Text("points")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.black)
                            .textCase(.none)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 7)
                    .padding(.leading, -15)) {
                        RewardItemButton(title: "Plushie", showAlert: $showAlert, selectedItem: $selectedItem)
                        RewardItemButton(title: "Keychain", showAlert: $showAlert, selectedItem: $selectedItem)
                    }
                    
                    Section(header: HStack {
                        Text("Redeem for")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.black)
                            .textCase(.none)
                        Text("15000")
                            .font(.custom("DS-Digital", size: 24))
                            .foregroundColor(.black)
                        Text("points")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.black)
                            .textCase(.none)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 7)
                    .padding(.leading, -15)) {
                        RewardItemButton(title: "Starbucks Drink", showAlert: $showAlert, selectedItem: $selectedItem)
                        RewardItemButton(title: "Movie Ticket", showAlert: $showAlert, selectedItem: $selectedItem)
                    }
                    
                    Section(header: HStack {
                        Text("Redeem for")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.black)
                            .textCase(.none)
                        Text("20000")
                            .font(.custom("DS-Digital", size: 24))
                            .foregroundColor(.black)
                        Text("points")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.black)
                            .textCase(.none)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 7)
                    .padding(.leading, -15)) {
                        RewardItemButton(title: "$15 Gift Card", showAlert: $showAlert, selectedItem: $selectedItem)
                        RewardItemButton(title: "Chick-fil-A Meal", showAlert: $showAlert, selectedItem: $selectedItem)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .background(Color.white)
                .scrollContentBackground(.hidden)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .imageScale(.large)
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding(.top, 5)
                        
                        Text("7000")
                            .font(.custom("DS-Digital", size: 24))
                            .foregroundColor(.black)
                        Text("pts")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView()) {
                        VStack(spacing: 2) {
                            Image(systemName: "gearshape")
                                .imageScale(.large)
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                                .padding(.top, 25)
                            Text("Settings")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                        }
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Sorry!"),
                    message: Text("You do not have enough points to redeem \(selectedItem)"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct RewardItemButton: View {
    let title: String
    @Binding var showAlert: Bool
    @Binding var selectedItem: String

    var body: some View {
        Button(action: {
            selectedItem = title
            showAlert = true
        }) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .padding(.trailing, 5)
                
                Text(title)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
        }
        .buttonStyle(HighlightButtonStyle())
    }
}

struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.blue.opacity(0.3) : Color.clear)
            .cornerRadius(8)
    }
}

struct RewardsView_Preview: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}

