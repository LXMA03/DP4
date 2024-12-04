//
//  Settings.swift
//  DP4
//
//  Created by Lydia Ma on 10/23/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.system(size: 36, weight: .semibold, design: .default))
                .padding(.top, 15)
            
            // Option to set time limit
            NavigationLink(destination: Option1View()) {
                Text("Set Entertainment Apps Time Limit")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            NavigationLink(destination: Option2View()) {
                Text("Contact Help Center")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            NavigationLink(destination: Option3View()) {
                Text("Set Sound Preferences")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

struct Option1View: View {
    @State private var selectedHour = 0
    @State private var selectedMin = 0
    @State private var alertType: AlertType? = nil

    let hours = Array(0...23)
    let minutes = Array(0...59)

    enum AlertType: Identifiable {
        case noTimeSet, highTimeLimit, timeSet

        var id: Int {
            hashValue
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Set Time Limit on Entertainment Apps")
                .font(.system(size: 36, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top, 15)

            // Labels for hours and minutes with pickers
            HStack(spacing: 20) {
                VStack {
                    Picker(selection: $selectedHour, label: Text("Hours")) {
                        ForEach(hours, id: \.self) { hour in
                            Text("\(hour)").tag(hour)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(maxWidth: 100)
                    
                    Text("Hours")
                        .font(.headline)
                }

                VStack {
                    Picker(selection: $selectedMin, label: Text("Minutes")) {
                        ForEach(minutes, id: \.self) { minute in
                            Text("\(minute)").tag(minute)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(maxWidth: 100)
                    
                    Text("Minutes")
                        .font(.headline)
                }
            }
            .padding()

            // Confirm Button
            Button(action: {
                if selectedHour == 0 && selectedMin == 0 {
                    alertType = .noTimeSet // Show no time alert
                } else if selectedHour > 4 || (selectedHour == 4 && selectedMin > 0) {
                    alertType = .highTimeLimit // Show high time limit alert
                } else {
                    alertType = .timeSet // Show time set confirmation
                }
            }) {
                Text("Confirm")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(item: $alertType) { alert in
                switch alert {
                case .noTimeSet:
                    return Alert(
                        title: Text("No Time Limit Set"),
                        message: Text("Set a valid time duration"),
                        dismissButton: .default(Text("OK"))
                    )
                case .highTimeLimit:
                    return Alert(
                        title: Text("Very High Time Limit"),
                        message: Text("Recommend less than 4 hours"),
                        dismissButton: .default(Text("OK"))
                    )
                case .timeSet:
                    return Alert(
                        title: Text("Time Limit Set"),
                        message: Text("Set for \(selectedHour) hours and \(selectedMin) minutes"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }

            Spacer()
        }
        .padding()
    }
}

struct Option2View: View {
    @State private var message = ""
    @State private var alertMessage = ""
    @State private var showConfirmationHelpCenter = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text ("Contact Help Center")
                .font(.system(size: 36, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
                .padding(.top, 15)
            
            TextField("Enter your message here: ", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(maxWidth: .infinity)
            
            Button(action: {
                // Action for setting screen time
                if message.isEmpty {
                    alertMessage = "No message has been sent"
                }
                else {
                    alertMessage = "Your message has been sent"
                }
                showConfirmationHelpCenter = true
            }) {
                Text("Confirm")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmationHelpCenter) {
                            Alert(
                                title: Text("Message Status"),
                                message: Text(alertMessage),
                                dismissButton: .default(Text("OK"))
                            )
                        }
            
            Spacer()
        }
        .padding()
    }
}

struct Option3View: View {
    @State private var volume: Double = 50
    @State private var showConfirmationAudio = false
    
    var body: some View {
        VStack(spacing: 20){
            Text ("Set Sound Preferences")
                .font(.system(size: 36, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
                .padding(.top, 15)
            
            VStack {
                Text("Volume: \(Int(volume))%")
                    .font(.title2)
                
                Slider(value: $volume, in: 0...100, step: 1)
                    .padding()
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                // Action for setting screen time
                showConfirmationAudio = true
            }) {
                Text("Confirm")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmationAudio) {
                            Alert(
                                title: Text("Volume Set"),
                                message: Text("Volume set to \(Int(volume))%"),
                                dismissButton: .default(Text("OK"))
                            )
                        }
            
            Spacer()
        }
        .padding()
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
