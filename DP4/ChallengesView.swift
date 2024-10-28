// Challenges UI for Application - Muhammad Khan
import SwiftUI

// Define a model for each challenge
struct Challenge: Identifiable {
    let id = UUID()
    let title: String
    var description: String
    var reward: String
    var points: Int
    var status: String
}

// Sample data for testing
let screenTimeChallenges = [
    Challenge(title: "Stay Under 2 Hours", description: "Limit screen time to 3 hours today", reward: "Unlock New Avatar", points: 50, status: "In Progress"),
    Challenge(title: "Social Media Detox", description: "No social media usage for 12 hours", reward: "Earn 100 Points", points: 100, status: "Pending"),
    Challenge(tile: "Weekend Challenge", description: "Stay under 12 hours over the course of the entire weekend", reward: "Bonus Level Access", points: 150, status: "Completed")
]

struct ChallengesView: View {
    // An array of challenges to display
    @State private var challenges: [Challenge] = screenTimeChallenges
    @State private var totalPoints = 0

    var body: some View {
        NavigationView {
            VStack {
                // Display total points at the top
                HStack {
                    Text("Total Points: \(totalPoints)")
                        .font(.headline)
                    Spacer()
                }
                .padding()

                List(challenges) { challenge in
                    HStack {
                        VStack(alignment: .leading) {
                            .font(.headline)
                        Text(challenge.description)
                            .font(.subheadline)
                            .foregroundColor(.grey)
                        Text("Reward: \(challenge.reward)")
                            .font(.footnote)
                            .foregroundColor(.blue)
                        }
                        Spacer()
                        VStack {
                            Text("\(challenge.points) pts")
                                .font(.caption)
                                .padding(6)
                                .background(Color.yellow)
                                .cornerRadius(8)
                            Text(challenge.status)
                                .font(.caption2)
                                .padding(6)
                                .background(statusColor(status: challenge.status))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .navigationTitle("Screen Time Challenges")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: addChallenge) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .onAppear {
            calculateTotalPoints()
        }
    }

    // Function to determine background color based on status
    private func statusColor(status: String) -> Color {
        switch status {
        case "Completed":
            return Color.green
        case "In Progress":
            return Color.orange
        case "Pending":
            return Color.red
        default:
            return Color.gray
        }
    }

    // Function to add a new challenge
    private func addChallenge() {
        let newChallenge = Challenge(title: "New Challenge", description: "Reduce screen time by 30 minutes", reward: "Earn 20 Points", points: 20, status: "Pending")
        challenges.append(newChallenge)
    }

    // Function to calculate the total points from completed challenges
    private func calculateTotalPoints() {
        totalPoints = challenges.filter { $0.status == "Completed" }.reduce(0) { $0 + $1.points }
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}