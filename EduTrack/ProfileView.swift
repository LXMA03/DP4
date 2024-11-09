//
//  ProfileView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Main Title
                Text("Profile")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .padding(.top, 15)
                
                // Display profile picture and user info
                VStack(spacing: 10) {
                    Image(systemName: "person.circle.fill") // Placeholder
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                    
                    Text("JohnDoe123")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("JohnDoe123@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 30) {
                    VStack {
                        Text("Active")
                            .font(.headline)
                        Text("5")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    VStack {
                        Text("Abandoned")
                            .font(.headline)
                        Text("3")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }
                    VStack {
                        Text("Completed")
                            .font(.headline)
                        Text("10")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
                .padding(.top, 20)
                Divider()
                    .padding(.vertical, 10)
                
                // Clickable Options
                VStack(spacing: 15) {
                    NavigationLink(destination: UsernameView()) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.pink)
                            Text("Username")
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: NotificationsView()) {
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.orange)
                            Text("Notifications")
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemname: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: Settings()) {
                        HStack {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.gray)
                            Text("Settings")
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
                .background(Color(UIColor.systemGroupedBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Profile")
            .toolbar {
                // Points
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .imageScale(.large)
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding(.top, 5)
                        
                        Text("7000")
                            .font(.custom("DS-Digital", size: 24))
                            .foregroundColor(.black)
                        Text("pts")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                    }
                }
                
                // Settings
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: Settings()) {
                        VStack(spacing: 2) {
                            Image(systemName: "gearshape")
                                .imageScale(.large)
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                                .padding(.top, 25)
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
            
struct ProfileView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

// Example Views for Navigation Links
struct UsernameView: View {
    var body: some View {
        Text("Change Username")
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notification")
    }
}
