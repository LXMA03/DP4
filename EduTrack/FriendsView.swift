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
    
    // Will show ChallengesView
    @State private var showChallengesView = false
    @State private var showAlert = false
    
    // Navigation
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
             
                // Main Title
                Text("Friends")
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
                                    
                                    Text("07000")
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
                        Spacer()
                        Image(systemName: friend.isSelected ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(friend.isSelected ? .green : .gray)
                            .onTapGesture {friend.isSelected.toggle()}
                    }
                }
                
                Button(action: {
                    if friends.contains(where: { $0.isSelected}) {
                        // Show challenge page if at least 1 friend selected
                        showChallengesView = true
                    }
                    else {
                        // Ask if user is sure they don't want to play with friends
                        showAlert = true
                    }
                    
                }) {
                    Text("Go to Challenges")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("No Friends Selected"),
                        message: Text("Are you sure you want to proceed without selecting any friends?"),
                        primaryButton: .default(Text("Yes"), action: {
                            showChallengesView = true // "Yes" button proceeds to ChallengesView even if no friends are chosen
                        }),
                        secondaryButton: .cancel(Text("No")) // "No" button cancels the action
                    )
                }
                .sheet(isPresented: $showChallengesView) {
                    ChallengesView()
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
