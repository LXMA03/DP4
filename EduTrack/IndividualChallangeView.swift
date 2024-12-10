//
//  IndividualChallengeView.swift
//  EduTrack
//
//  Created by Jane Bae on 11/9/24.
//

import SwiftUI

let individualChallenges = [
    Challenge(
        title: "Duolingo Challenge",
        description: "Learn new language using Duolingo for 24 hours",
        duration: "Weekly",
        points: 60,
        status: "In Progress"
    ),
    Challenge(
        title: "Quizlet Challenge",
        description: "Study using Quizlet for 30 hours",
        duration: "Weekly",
        points: 100,
        status: "Completed"
    ),
    Challenge(
        title: "Kindle Challenge",
        description: "Read books using Kindle for 50 hours",
        duration: "Monthly",
        points: 150,
        status: "Completed"
    )
]

let newChallengeOptions = [
    ChallengeItem(
        title: "Limit screen time to 4 hours per day",
        label: "Weekly",
        points: 80
    ),
    ChallengeItem(
        title: "Study using Quizlet for 40 hours",
        label: "Weekly",
        points: 300
    ),
    ChallengeItem(
        title: "Study using Google PowerPoint for 1 hour per day",
        label: "Monthly",
        points: 400
    )
]

struct IndividualChallengeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var totalPoints = 7000
    @State private var challenges = individualChallenges
    @State private var availableChallenges = newChallengeOptions
    @State private var showChallengeSelection = false
    @State private var showCustomizeChallenge = false
    @State private var showDeleteConfirmation = false
    @State private var challengeToDelete: Challenge? = nil

    var body: some View {
        NavigationView {
            VStack {
                Text("Individual Challenge")
                    .font(.system(size: 36, weight: .semibold))
                    .padding(.top, 30)
                Text("Challenge yourself and earn points!")
                    .font(.system(size: 14))
                    .padding(.top, -10)

                HStack {
                    Spacer()
                    Text("Current Points:")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text("\(totalPoints)")
                        .font(.custom("DS-Digital", size: 24))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()

                List {
                    ForEach(challenges) { challenge in
                        ChallengeRowView(challenge: challenge)
                            .swipeActions {
                                Button(role: .destructive) {
                                    challengeToDelete = challenge
                                    showDeleteConfirmation = true
                                } label: {
                                    Text("Delete")
                                }
                            }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.white)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button(action: {
                                showChallengeSelection = true
                            }) {
                                Text("Select a Challenge")
                                Image(systemName: "list.bullet")
                            }
                            Button(action: {
                                showCustomizeChallenge = true
                            }) {
                                Text("Customize a Challenge")
                                Image(systemName: "pencil")
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showChallengeSelection) {
                    ChallengeSelectionView(challenges: $availableChallenges, selectedFriend: "You") { selectedChallenge in
                        addSelectedChallenge(selectedChallenge)
                    }
                }
                .sheet(isPresented: $showCustomizeChallenge) {
                    CustomizeChallengeView(challenges: availableChallenges) { title, description, points, duration in
                        addCustomizedChallenge(title: title, description: description, points: points, duration: duration)
                    }
                }

                .alert(isPresented: $showDeleteConfirmation) {
                    Alert(
                        title: Text("Deleting Challenge"),
                        message: Text("Are you sure you want to delete this challenge?"),
                        primaryButton: .destructive(Text("Confirm")) {
                            deleteChallenge()
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                }
            }
            .padding(.bottom, 20)
        }
    }

    private func addSelectedChallenge(_ challenge: ChallengeItem) {
        let titleMap: [String: String] = [
            "Limit screen time to 4 hours per day": "Screen Time Challenge",
            "Study using Quizlet for 40 hours": "Quizlet Challenge",
            "Study using Google PowerPoint for 1 hour per day": "Google PPT Challenge"
        ]
        let title = titleMap[challenge.title] ?? "New Challenge"
        let newChallenge = Challenge(
            title: title,
            description: challenge.title,
            duration: challenge.label,
            points: challenge.points,
            status: "In Progress"
        )
        challenges.append(newChallenge)
    }

    private func addCustomizedChallenge(title: String, description: String, points: Int, duration: String) {
        let newChallenge = Challenge(
            title: title,
            description: description,
            duration: duration,
            points: points,
            status: "In Progress"
        )
        challenges.append(newChallenge)
    }

    private func deleteChallenge() {
        if let challengeToDelete = challengeToDelete,
           let index = challenges.firstIndex(where: { $0.id == challengeToDelete.id }) {
            challenges.remove(at: index)
        }
    }
}

struct ChallengeRowView: View {
    let challenge: Challenge

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(challenge.title)
                        .font(.system(size: 24, weight: .bold))
                    Text(challenge.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Duration: \(challenge.duration)")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                Spacer()
                VStack(alignment: .center) {
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
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(.vertical, 8)
    }

    private func statusColor(status: String) -> Color {
        switch status {
        case "Completed":
            return Color.green
        case "In Progress":
            return Color.orange
        default:
            return Color.gray
        }
    }
}

struct IndividualChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualChallengeView()
    }
}
