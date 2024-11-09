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
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
            
            // Option to set time limit
            NavigationLink(destination: Option1View()) {
                Text("Set entertainment time limit")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
    }
}

struct Option1View: View {
    // Variables
    @State private var selectedHour = 0
    @State private var selectedMin = 0
    @State private var selectedSec = 0
    
    // Arrays to hold the time selector
    let hours = Array(0...23)
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Set Time Limit on Entertainment Apps")
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
            
            // Create pickers for hours, min, and sec
            HStack {
                // Hour selector
                Picker(selection: $selectedHour, label: Text("Hour(s)")) {
                    ForEach(hours, id: \.self) { hour in Text("\(hour)").tag(hour)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: 100)
                
                // Minute selector
                Picker(selection: $selectedMin, label: Text("Minutes")) {
                    ForEach(minutes, id: \.self) { minute in Text("\(minute)").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: 100)
                
                // Second selector
                Picker(selection: $selectedSec, label: Text("Seconds")) {
                    ForEach(seconds, id: \.self) { second in Text("\(second)  sec").tag(second)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: 100)
            }
            .padding()
            
            // Button to confirm the time selected
            Button(action: {
                // Action for setting screen time
                print("Screen time selected for \(selectedHour) hours, \(selectedMin) minutes, \(selectedSec) seconds")
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
            
            Spacer()
        }
        .padding()
        .navigationTitle("Set Time Limit")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
