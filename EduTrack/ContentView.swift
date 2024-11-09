//
//  ContentView.swift
//  DP4
//
//  Created by Lydia Ma on 10/22/24. Worked on by Muhammad Khan on 11/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0  // Track the selected tab

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()  // Home Screen
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            RewardsView()  // Rewards Screen
                .tabItem {
                    Image(systemName: "gift.fill")
                    Text("Rewards")
                }
                .tag(1)

            CompetitionView()  // Competition Screen
                .tabItem {
                    Image(systemName: "trophy.fill")
                    Text("Competition")
                }
                .tag(2)

            FriendsView()  // Friends Screen
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                }
                .tag(3)

            ProfileView()  // Profile Screen
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(.blue)  // Customize the accent color
        .onAppear {
            #if os(iOS)
                setupTabBarAppearance()
            #endif
        }
    }

    // Customize the appearance of the Tab Bar for iOS only
    #if os(iOS)
        private func setupTabBarAppearance() {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor.systemGray6

            UITabBar.appearance().standardAppearance = tabBarAppearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    #endif
}

// Sample Views for the Tab Items
struct Home_View: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Home Screen!")
                    .font(.title)
                    .padding()
                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}

struct Rewards_View: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Rewards Await You!")
                    .font(.title)
                    .padding()
                Spacer()
            }
            .navigationTitle("Rewards")
        }
    }
}

struct Competition_View: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Join Competitions and Win!")
                    .font(.title)
                    .padding()
                Spacer()
            }
            .navigationTitle("Competition")
        }
    }
}

struct Friends_View: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Connect with Friends!")
                    .font(.title)
                    .padding()
                Spacer()
            }
            .navigationTitle("Friends")
        }
    }
}

struct Profile_View: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Profile")
                    .font(.title)
                    .padding()
                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
