import SwiftUI

struct CompetitionView: View {
    @State private var showIndividualChallenges = false
    @State private var showCompetitiveChallenges = false
    @State private var challenges = [
        Challenge(
            title: "Challenge with Lydia", description: "Limit screen time to 3 hours per day",
            duration: "Weekly", points: 50, status: "In Progress"
        ),
        Challenge(
            title: "Challenge with Muhammad", description: "No social media usage for 12 hours",
            duration: "Daily", points: 100, status: "Pending"
        ),
        Challenge(
            title: "Challenge with Jane", description: "Limit social media apps under 12 hours per week",
            duration: "Monthly", points: 150, status: "Pending"
        ),
    ]
    @State private var selectedViewTitle = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Challenges")
                    .font(.system(size: 36, weight: .semibold))
                    .padding(.top, 30)
                
                Text("You can complete challenges for more points!")
                    .font(.system(size: 14, design: .default))
                    .padding(.top, -10)
                
                .toolbar {
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
                
                VStack(spacing: 15) {
                    // Navigation to CompetitiveChallenges
                    Button(action: {
                        showCompetitiveChallenges = true
                    }) {
                        Text("Go to Competitive Challenges")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .sheet(isPresented: $showCompetitiveChallenges) {
                        CompetitiveChallenges()
                    }
                    
                    // Navigation to Individual Challenges
                    Button(action: {
                        showIndividualChallenges = true
                    }) {
                        Text("Go to Individual Challenges")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .sheet(isPresented: $showIndividualChallenges) {
                        IndividualChallengeView()
                    }
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding()
        }
    }
}

struct CompetitiveChallengesView: View {
    @State private var showLeaderboard = false

    var body: some View {
        VStack {
            Text("Competitive Challenge")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)
            
            Spacer()
            
            Button(action: {
                showLeaderboard = true
            }) {
                Text("Go to Leaderboard")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }
            .sheet(isPresented: $showLeaderboard) {
                LeaderboardView()
            }
        }
        .padding()
    }
}

struct IndividualChallengesView: View {
    var body: some View {
        VStack {
            Text("Individual Challenge")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)
            
            Spacer()
        }
        .padding()
    }
}

struct LeaderboardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Leaderboard")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)

            List {
                Section(header: VStack(alignment: .leading) {
                    Text("In Progress")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .textCase(.none)
                    
                    Text("Competition with Lydia")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.black)
                        .textCase(.none)

                }) {
                    HStack {
                        Text("1.")
                            .font(.system(size: 20))
                        Text("Lydia")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.leading, 5)
                        Spacer()
                        Text("Winning")
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.leading, 20)

                    HStack {
                        Text("2.")
                            .font(.system(size: 20))
                        Text("John")
                            .font(.system(size: 20))
                            .padding(.leading, 5)
                    }
                    .padding(.leading, 20)
                }
                .padding(.top, 10)
                .padding(.bottom, 7)
                .padding(.leading, -30)
            }
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
            .background(Color.white)

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
