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
                
                    .toolbar {
                        // Points
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination: RewardsView()) {
                                HStack {
                                    Image(systemName: "dollarsign.circle")
                                        .imageScale(.large)
                                        .font(.system(size: 24))
                                        .foregroundColor(.black)
                                        .padding(.top, 5)
                                    
                                    Text("07000")
                                        .font(.custom("DS-Digital", size: 24))
                                        .foregroundColor(.black)
                                }
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
                
                    
                    List {
                        Text("Plushie - 1000 pts")
                        Text("Starbucks Drink - 15000 pts")
                        Text("$10 Gift Card - 30000 pts")
                    }
                    
                }
            }
        }
        
        struct RewardsView_Preview: PreviewProvider {
            static var previews: some View {
                RewardsView()
            }
        }
    }
