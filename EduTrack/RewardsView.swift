//
//  RewardsView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct RewardsView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Main Title
                Text("Rewards")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .padding(.top, 15)
                        
                        // Rewards List
                        List {
                            // List for 10,000 points
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
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .alignmentGuide(.leading) { d in d[.leading] }) {
                                    Text("Plushie")
                                        .padding(.leading)
                                    Text("Keychain")
                                        .padding(.leading)
                                }
                            
                            // List for 15,000 points
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
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .alignmentGuide(.leading) { d in d[.leading] }) {
                                    Text("Statbucks Drink")
                                        .padding(.leading)
                                    Text("Movie Ticket")
                                        .padding(.leading)
                                }
                            
                            // List for 20,000 points
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
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .alignmentGuide(.leading) { d in d[.leading] }) {
                                    Text("$15 Gift Card")
                                        .padding(.leading)
                                    Text("Chick-fil-A Meal")
                                        .padding(.leading)
                                }
                        }
                            
                        .listStyle(InsetGroupedListStyle())
                        .background(Color.white)
                        .scrollContentBackground(.hidden)
                
                        Spacer()
                        }
            
            .toolbar {
                // Points
                ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Image(systemName: "dollarsign.circle")
                                .imageScale(.large)
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                                .padding(.top, 5)
                            
                            Text("07000")
                                .font(.custom("DS-Digital", size: 24))
                                .foregroundColor(.black)
                            Text("pts")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                        }
                }
                        
                        // Settings
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
                    
            }
        }
    }
        
    struct RewardsView_Preview: PreviewProvider {
        static var previews: some View {
            RewardsView()
    }
}
