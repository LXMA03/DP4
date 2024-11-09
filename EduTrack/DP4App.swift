//
//  DP4App.swift
//  DP4
//
//  Created by Lydia Ma on 10/22/24.
//

import SwiftUI

@main
struct DP4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color.white) // Sets a global white background
                .foregroundColor(.black) // Sets a global black text color
                .environment(\.colorScheme, .light)// main view, starts the app
        }
    }
}
