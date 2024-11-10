//
//  CompetitionView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24. Worked further on by Muhammad Khan on 11/04/2024
//

import SwiftUI

struct Competition: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var participants: Int
    var progress: Double
}

let sampleCompetitions = [
    Competition(
        title: "Competitive Challenge", description: "Challenge with Lydia: Limit screen time to 3 hours per day", participants: 2,
        progress: 0.6),
    Competition(
        title: "Individual Challenge", description: "Challenge 1: Learn new language using Duolingo for 24 hours", participants: 1,
        progress: 0.4)
]

struct CompetitionView: View {
    @State private var competitions = sampleCompetitions
    @State private var showLeaderboard = false  // State to control leaderboard view navigation

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Main Title
                Text("Competition")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .padding(.top, 30)
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

                // List of competitions
                ScrollView {
                    ForEach(competitions) { competition in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(competition.title)
                                .font(.headline)
                            
                            Text(competition.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack {
                                Spacer()
                                Text("\(competition.participants) Participants")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            
                            // Progress bar
                            ProgressView(value: competition.progress)
                                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                                .frame(height: 8)
                                .cornerRadius(4)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding([.horizontal, .top])
                    }
                }
                
                // Go to Leaderboard button
                HStack {
                    Spacer()
                    Button(action: {
                        showLeaderboard = true  // Set to true to trigger navigation
                    }) {
                        Text("Go to Leaderboard")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .sheet(isPresented: $showLeaderboard) {  // Present LeaderboardView as a sheet
                    LeaderboardView()
                }
            }
            .padding(.vertical)
        }
    }
}

struct LeaderboardView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Leaderboard")
                .font(.system(size: 36, weight: .semibold, design: .default))
                .padding(.top, 30)

            // Subtitle
            Text("In Process: Competition with Lydia")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, -10)
            
            Spacer()
        }
        .padding()
    }
}

struct CompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionView()
    }
}
