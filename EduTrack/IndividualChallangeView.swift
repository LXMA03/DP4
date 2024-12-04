//
//  IndividualChallengeView.swift
//  EduTrack
//
//  Created by Jane Bae on 11/9/24.
//

import SwiftUI

// Sample Data for Individual Challenges
let individualChallenges = [
    Challenge(
        title: "Challenge 1",
        description: "Learn new language using Duolingo for 24 hours",
        duration: "Weekly",
        points: 60,
        status: "In Progress"
    ),
    Challenge(
        title: "Challenge 2",
        description: "Study using Quizlet for 30 hours",
        duration: "Weekly",
        points: 100,
        status: "Completed"
    ),
    Challenge(
        title: "Challenge 3",
        description: "Read books using Kindle for 50 hours",
        duration: "Monthly",
        points: 150,
        status: "Completed"
    )
]

// Sample Data for New Challenge Options
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
    @State private var showChallengeSelection = false
    @State private var showDeleteConfirmation = false
    @State private var challengeToDelete: Challenge? = nil
    @State private var nextChallengeNumber = 4

    var body: some View {
        NavigationView {
            VStack {
                
                // Main Title
                Text("Individual Challenge")
                    .font(.system(size: 36, weight: .semibold))
                    .padding(.top, 30)
                Text("Challenge yourself and earn points!")
                    .font(.system(size: 14, design: .default))
                    .padding(.top, -10)
                
                // Current Points Section
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

                // List of Challenges
                List {
                    ForEach(challenges) { challenge in
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
                        .listRowBackground(Color.clear)
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
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showChallengeSelection = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) { 
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                }
                .sheet(isPresented: $showChallengeSelection) {
                    IndividualChallengeSelectionView { selectedChallenge in
                        addSelectedChallenge(selectedChallenge)
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
        let newChallenge = Challenge(
            title: "Challenge \(nextChallengeNumber)",
            description: challenge.title,
            duration: challenge.label,
            points: challenge.points,
            status: "In Progress"
        )
        challenges.append(newChallenge)
        nextChallengeNumber += 1
    }
    
    private func deleteChallenge() {
        if let challengeToDelete = challengeToDelete,
           let index = challenges.firstIndex(where: { $0.id == challengeToDelete.id }) {
            challenges.remove(at: index)
        }
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


struct IndividualChallengeSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var challenges = newChallengeOptions
    @State private var selectedChallenge: ChallengeItem? = nil
    var onConfirm: (ChallengeItem) -> Void

    var body: some View {
        VStack {
            NavigationStack {
                List($challenges) { $challenge in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(challenge.title)
                                .font(.body)
                                .padding(.vertical, 5)
                            Text(challenge.label)
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        Spacer()
                        Text("\(challenge.points) pts")
                            .font(.caption)
                            .padding(6)
                            .background(Color.yellow)
                            .cornerRadius(8)
                        Image(systemName: selectedChallenge?.id == challenge.id ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(selectedChallenge?.id == challenge.id ? .blue : .gray)
                            .onTapGesture {
                                if selectedChallenge?.id == challenge.id {
                                    selectedChallenge = nil
                                } else {
                                    selectedChallenge = challenge
                                }
                            }
                    }
                    .contentShape(Rectangle())
                    .listRowBackground(Color.white)
                }
                .navigationBarTitle("Select a Challenge", displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                })
            }
            
            Button(action: {
                if let selectedChallenge = selectedChallenge {
                    onConfirm(selectedChallenge)
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Confirm")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom, 20)
            .disabled(selectedChallenge == nil)
        }
    }
}

struct IndividualChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualChallengeView()
    }
}
