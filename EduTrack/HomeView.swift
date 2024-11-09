//
//  HomeView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//

import SwiftUI
import Charts

struct PieSegment: Identifiable {
    let id = UUID()
    let color: Color
    let value: Double
    let label: String
}

struct PieChartView: View {
    let pieData: [PieSegment]

    var body: some View {
        Chart(pieData) { segment in
            SectorMark(
                angle: .value("Value", segment.value)
            )
            .foregroundStyle(segment.color)
        }
        .frame(width: 300, height: 300)
        .padding()
    }
}

struct HomeView: View {
    let pieData = [
        PieSegment(color: .green, value: 60, label: "Educational Activity"),
        PieSegment(color: .red, value: 40, label: "Entertainment Activity")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {  // Increased spacing between items
                
                // Main Title
                Text("Today’s Activity")
                    .font(.system(size: 36, weight: .bold, design: .default))
                    .padding(.top, 10)
                
                // Pie Chart
                PieChartView(pieData: pieData)
                
                Text("Points Rule: 10 points every hour on Educational Activity")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Spacer()
            }
            .toolbar {
                // Points
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
