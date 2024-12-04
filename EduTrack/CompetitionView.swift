import SwiftUI

struct Competition: Identifiable {
    let id = UUID()
    let title: String
}

let sampleCompetitions = [
    Competition(title: "Go to Competitive Challenges"),
    Competition(title: "Go to Individual Challenges")
]

struct CompetitionView: View {
    @State private var competitions = sampleCompetitions

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Competition")
                    .font(.system(size: 36, weight: .semibold))
                    .padding(.top, 30)

                Text("You can compete in challenges for more points!")
                    .font(.system(size: 14, design: .default))
                    .padding(.top, -10)

                VStack(spacing: 15) {
                    NavigationLink(destination: DetailView(competitionTitle: "Go to Competitive Challenges")) {
                        Text("Go to Competitive Challenges")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }

                    NavigationLink(destination: DetailView(competitionTitle: "Go to Individual Challenges")) {
                        Text("Go to Individual Challenges")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding(.vertical)
        }
    }
}

struct DetailView: View {
    let competitionTitle: String
    @State private var showLeaderboard = false

    var body: some View {
        VStack {
            Text("\(competitionTitle) Details")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)

            Spacer()

            if competitionTitle == "Go to Competitive Challenges" {
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
        }
        .navigationTitle(competitionTitle)
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
