//
//  HomeView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {  // Increased spacing between items
                Text("Today’s Activity")
                // Custom font size and weight
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .padding(.top, 40)
                
                // Replace this placeholder with your pie chart
                Circle()
                    .fill(Color.green)
                    .frame(width: 200, height: 200)
                    .padding()
                
                Text("Points Rule: 10 points every hour on Educational Activity")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            .navigationTitle("Settings")
            
            .toolbar {
                // Settings button to navigate to settings
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingView()) {
                        // Icon for settings
                        Image(systemName: "gearshape")
                            .imageScale(.large)
                            .font(.system(size: 24))
                    }
                }
            }
        }
    }
}


    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

