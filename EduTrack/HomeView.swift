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
                
                // Main Title
                Text("Today’s Activity")
                // Custom font size and weight
                    .font(.system(size: 36, weight: .bold, design: .default))
                    .padding(.top, 40)
                
                // Pie Chart
                Circle()
                    .fill(Color.green)
                    .frame(width: 200, height: 200)
                    .padding()
                
                Text("Points Rule: 10 points every hour on Educational Activity")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            // Points
            .toolbar {
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
                                .padding(.top, 10)
                            Text("Settings")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                        }
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
