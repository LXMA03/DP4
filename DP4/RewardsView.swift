//
//  RewardsView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct RewardsView: View {
    var body: some View {
        VStack {
            Text("Redeem Rewards")
                .font(.largeTitle)
                .padding()
            
            List {
                Text("Plushie - 1000 pts")
                Text("Starbucks Drink - 15000 pts")
                Text("$10 Gift Card - 30000 pts")
            }
        }
        
    }
}
