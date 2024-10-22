//
//  HomeView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 30) {  // Increased spacing between items
            Text("Today’s Activity")
                .font(.system(size: 28, weight: .bold, design: .default))  // Custom font size and weight
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

    }
}

