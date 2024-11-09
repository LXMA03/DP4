//
//  RewardsView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct RewardsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Rewards")
                .font(.system(size: 36, weight: .semibold, design: .default))
                .padding(.top, 15)
            
            List {
                Text("Plushie - 1000 pts")
                Text("Starbucks Drink - 15000 pts")
                Text("$10 Gift Card - 30000 pts")
            }
        }
        
    }
}

struct RewardsView_Preview: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}
