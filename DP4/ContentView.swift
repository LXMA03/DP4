//
//  ContentView.swift
//  DP4
//
//  Created by Lydia Ma on 10/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()  // Home Screen
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            RewardsView()  // Rewards Screen
                .tabItem {
                    Image(systemName: "gift.fill")
                    Text("Rewards")
                }
            
            CompetitionView()  // Competition Screen
                .tabItem {
                    Image(systemName: "trophy.fill")
                    Text("Competition")
                }
            
            FriendsView()  // Friends Screen
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                }
            
            ProfileView()  // Profile Screen
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

