//
//  CustomizeChallengeView.swift
//  EduTrack
//
//  Created by Jane Bae on 12/4/24.
//

import SwiftUI

struct CustomizeChallengeView: View {
    @Binding var challenges: [ChallengeItem]
    var onComplete: () -> Void
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var duration: String = "Daily"
    @State private var points: Int = 50
    
    let durations = ["Daily", "Weekly", "Monthly"]
    let pointOptions = [50, 70, 100]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.headline)
                    TextField("Enter challenge title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                    TextField("Enter challenge description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("Duration")
                        .font(.headline)
                    Picker("Duration", selection: $duration) {
                        ForEach(durations, id: \.self) { duration in
                            Text(duration).tag(duration)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("Points")
                        .font(.headline)
                    Picker("Points", selection: $points) {
                        ForEach(pointOptions, id: \.self) { point in
                            Text("\(point)").tag(point)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)

                Spacer()

                Button(action: addCustomChallenge) {
                    Text("Confirm")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .navigationBarTitle("Customize a Challenge", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        onComplete()
                    }
                }
            }
        }
    }

    private func addCustomChallenge() {
        guard !title.isEmpty, !description.isEmpty else {
            // Handle empty fields (Optional)
            return
        }

        let newChallenge = ChallengeItem(
            title: title,
            label: duration,
            points: points
        )
        
        challenges.append(newChallenge)
        onComplete()
    }
}
