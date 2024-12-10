import SwiftUI

struct CompetitionView: View {
    @State private var showIndividualChallenges = false
    @State private var showCompetitiveChallenges = false
    @State private var pendingChallenges = [
        PendingChallenge(sender: "Jane", description: "Reading books for 40 hours", duration: "Weekly", points: 100),
        PendingChallenge(sender: "Cynthia", description: "Studying Quizlet for 5 hours", duration: "Daily", points: 50)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Challenges")
                        .font(.system(size: 36, weight: .semibold))
                        .padding(.top, 30)
                    
                    Text("You can complete challenges for more points!")
                        .font(.system(size: 14))
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
                    
                    Divider()
                        .padding(.vertical, 20)
                    
                    Text("Pending Challenges")
                        .font(.system(size: 30, weight: .semibold))
                        .padding(.bottom, 10)
                    
                    VStack(spacing: 15) {
                        ForEach($pendingChallenges) { $challenge in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("\(challenge.sender) has requested a challenge")
                                        .font(.headline)
                                    Text(challenge.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text("Duration: \(challenge.duration)")
                                        .font(.footnote)
                                        .foregroundColor(.blue)
                                    Text("Points: \(challenge.points)")
                                        .font(.footnote)
                                        .foregroundColor(.orange)
                                }
                                Spacer()
                                Button(action: {
                                    acceptChallenge(challenge)
                                }) {
                                    Text("Accept")
                                        .font(.headline)
                                        .padding(8)
                                        .frame(width: 80)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
                        }
                    }
                }
                .padding()
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
    
    private func acceptChallenge(_ challenge: PendingChallenge) {
        if let index = pendingChallenges.firstIndex(where: { $0.id == challenge.id }) {
            pendingChallenges.remove(at: index)
        }
    }
}

struct PendingChallenge: Identifiable {
    let id = UUID()
    let sender: String
    let description: String
    let duration: String
    let points: Int
}

struct CompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionView()
    }
}
