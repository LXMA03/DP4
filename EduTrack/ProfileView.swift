//
//  ProfileView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Main Title
                Text("Profile")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .padding(.top, 15)
                
                    .toolbar {
                        // Points
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
}

