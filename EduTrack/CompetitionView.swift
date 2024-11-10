import SwiftUI
import Charts

struct Competition: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var participants: Int
    var progress: Double
    let dateRange: String
}

let sampleCompetitions = [
    Competition(
        title: "Competitive Challenge",
        description: "Challenge with Lydia: Limit screen time to 3 hours per day",
        participants: 2,
        progress: 0.6,
        dateRange: "11/1/24 - 11/8/24"
    ),
    Competition(
        title: "Individual Challenge",
        description: "Challenge 1: Learn new language using Duolingo for 24 hours",
        participants: 1,
        progress: 0.4,
        dateRange: "11/5/24 - 11/12/24"
    )
]

struct CompetitionView: View {
    @State private var competitions = sampleCompetitions
    @State private var showLeaderboard = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Competition")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .padding(.top, 30)
                Text("Here are your current In Progress challenges!")
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

                ScrollView {
                    ForEach(competitions) { competition in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(competition.title)
                                .font(.headline)
                            
                            Text(competition.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text(competition.dateRange)
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            HStack {
                                Spacer()
                                Text("\(competition.participants) Participants")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            
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
                
                HStack {
                    Spacer()
                    Button(action: {
                        showLeaderboard = true
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
                .sheet(isPresented: $showLeaderboard) {
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
            Text("Leaderboard")
                .font(.system(size: 36, weight: .semibold, design: .default))
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
        LeaderboardView()
    }
}
