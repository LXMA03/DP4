//
//  CompetitiveChallenges.swift
//  EduTrack
//
//  Created by Jane Bae on 12/9/24.
//

import SwiftUI

struct competitiveChallenge: Identifiable {
    let id = UUID()
    let title: String
    var description: String
    var duration: String
    var points: Int
    var status: String
}

struct competitiveChallengeItem: Identifiable {
    let id = UUID()
    let title: String
    let label: String
    let points: Int
}

let CompetitiveChallengesList = [
    Challenge(
        title: "Challenge with Lydia", description: "Limit screen time to 3 hours per day",
        duration: "Weekly", points: 50, status: "In Progress"),
    Challenge(
        title: "Challenge with Muhammad", description: "No social media usage for 12 hours",
        duration: "Daily", points: 100, status: "Pending"),
    Challenge(
        title: "Challenge with Jane",
        description: "Limit social media apps under 12 hours per week",
        duration: "Monthly", points: 150, status: "Pending"),
]

struct ChallengeSelectionListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var challenges: [ChallengeItem]
    @State private var selectedChallenge: ChallengeItem? = nil
    var selectedFriend: String
    var onConfirm: (ChallengeItem) -> Void

    var body: some View {
        NavigationView {
            List {
                ForEach(challenges) { challenge in
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

struct CompetitiveChallenges: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var challenges = CompetitiveChallengesList
    @State private var totalPoints = 7000
    @State private var showDeleteConfirmation = false
    @State private var challengeToDelete: Challenge?
    @State private var showAlert = false
    @State private var showFriendsView = false

    private var dismissButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Competitive Challenge")
                    .font(.system(size: 36, weight: .semibold))
                    .padding(.top, 30)
                Text("Compete with friends and family!")
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
                        VStack {
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
                                showDeleteConfirmation = true
                                challengeToDelete = challenge
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
                        dismissButton
                    }
                }
                .alert(isPresented: $showDeleteConfirmation) {
                    Alert(
                        title: Text("Deleting Challenge"),
                        message: Text("Are you sure you want to delete this challenge?"),
                        primaryButton: .destructive(Text("Delete")) {
                            deleteChallenge()
                        },
                        secondaryButton: .cancel()
                    )
                }

                Spacer()

                Button(action: {
                    showFriendsView = true
                }) {
                    Text("Add a Challenge")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("No Friends Selected"),
                        message: Text("Choose a friend to compete with!"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .sheet(isPresented: $showFriendsView) {
                    FriendsView()
                }
            }
            .onAppear {
                calculateTotalPoints()
            }
        }
    }

    private func deleteChallenge() {
        if let challengeToDelete = challengeToDelete,
           let index = challenges.firstIndex(where: { $0.id == challengeToDelete.id }) {
            challenges.remove(at: index)
        }
    }

    private func calculateTotalPoints() {
        totalPoints = 7000 + challenges.filter { $0.status == "Completed" }.reduce(0) { $0 + $1.points }
    }

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
}

struct CompetitiveChallenges_Previews: PreviewProvider {
    static var previews: some View {
        CompetitiveChallenges()
    }
}
