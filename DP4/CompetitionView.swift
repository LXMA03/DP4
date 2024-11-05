//
//  CompetitionView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24. Worked further on by Muhammad Khan on 11/04/2024
//
import SwiftUI

// Define a model for each competition
struct Competition: Identifiable {
    let id = UUID()
    let name: String
    var participants: Int
    var prize: String
    var progress: Double  // Progress as a percentage
}

// Sample data for competitions
let sampleCompetitions = [
    Competition(
        name: "Daily Screen Time Challenge", participants: 25, prize: "Exclusive Avatar",
        progress: 0.6),
    Competition(name: "Weekend Detox", participants: 18, prize: "Bonus Points", progress: 0.4),
    Competition(
        name: "Social Media Free Week", participants: 32, prize: "Gift Card", progress: 0.8),
]

struct CompetitionView: View {
    // State variables to hold competition data and total competitions
    @State private var competitions = sampleCompetitions

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                // Header section
                Text("Competitions")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)

                // Leaderboard button
                HStack {
                    Spacer()
                    Button(action: {
                        // Action to view leaderboard
                    }) {
                        Text("View Leaderboard")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // Divider for separation
                Divider()

                // List of competitions
                ScrollView {
                    ForEach(competitions) { competition in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(competition.name)
                                    .font(.headline)
                                Spacer()
                                Text("\(competition.participants) Participants")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Text("Prize: \(competition.prize)")
                                .font(.subheadline)
                                .foregroundColor(.green)
                            // Progress bar
                            ProgressView(value: competition.progress)
                                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                                .frame(height: 8)
                                .cornerRadius(4)
                        }
                        .padding()
                        .background(Color.secondary)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Competitions")
            .padding(.vertical)
        }
    }
}

struct CompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionView()
    }
}
