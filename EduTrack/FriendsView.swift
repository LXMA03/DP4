//
//  FriendsView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool
}

struct FriendsView: View {
    @State private var friends = [
        // List of friends
        Friend(name: "Jane", isSelected: false),
        Friend(name: "Cynthia", isSelected: false),
        Friend(name: "Lydia", isSelected: false),
        Friend(name: "Muhammad", isSelected: false)
    ]
    
    @State private var challenges = [
            Challenge(title: "Challenge with Lydia", description: "Limit screen time to 3 hours per day", duration: "Weekly", points: 50, status: "In Progress"),
            Challenge(title: "Challenge with Muhammad", description: "No social media usage for 12 hours", duration: "Daily", points: 100, status: "Pending"),
            Challenge(title: "Challenge with Jane", description: "Limit social media apps under 12 hours per week", duration: "Monthly", points: 150, status: "Pending"),
    ]
    
    @State private var showChallengesView = false
    @State private var selectedFriendName = ""
    @State private var showIndividualChallengeView = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
             
                // Main Title
                Text("Friends")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .padding(.top, 30)
                Text("Try out new challenges with your friends!")
                    .font(.system(size: 14, design: .default))
                    .padding(.top, -10)
                
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
                
                List($friends) { $friend in
                    HStack {
                        Text(friend.name)
                            .padding(.vertical, 10)
                        Spacer()
                        Image(systemName: friend.isSelected ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(friend.isSelected ? .green : .gray)
                            .onTapGesture {
                                if friend.isSelected {
                                    friend.isSelected = false
                                    selectedFriendName = ""
                                } else {
                                    for index in friends.indices {
                                        friends[index].isSelected = false
                                    }
                                    friend.isSelected = true
                                    selectedFriendName = friend.name
                                }
                            }
                    }
                    .listRowBackground(Color.white)
                }
                .listStyle(InsetGroupedListStyle())
                .scrollContentBackground(.hidden)
                
                Button(action: {
                    if friends.contains(where: { $0.isSelected }) {
                        // Show challenge page if a friend is selected
                        showChallengesView = true
                    } else {
                        // Show alert if no friend is selected
                        showAlert = true
                    }
                }) {
                    Text("Challenge")
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
                .sheet(isPresented: $showChallengesView) {
                    ChallengesView(challenges: $challenges, selectedFriendName: selectedFriendName)
                }
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
