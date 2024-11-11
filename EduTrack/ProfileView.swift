//
//  ProfileView.swift
//  DP4
//
//  Created by Cynthia Rosales on 10/22/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Profile")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .padding(.top, 15)
                
                VStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                    
                    Text("JohnDoe123")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("JohnDoe123@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                
                HStack(spacing: 30) {
                    VStack {
                        Text("Active Challenge")
                            .font(.headline)
                        Text("2")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    VStack {
                        Text("Completed Challenge")
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
                
                VStack(spacing: 15) {
                    NavigationLink(destination: PersonalInformationView()) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.pink)
                            Text("Personal Information")
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .background(Color.white)
                        .padding()
                    }
                    
                    NavigationLink(destination: NotificationsView()) {
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.orange)
                            Text("Notifications")
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .background(Color.white)
                        .padding()
                    }
                }
                .cornerRadius(10)
                .padding(.horizontal)
                .background(Color.white)
                
                Spacer()
            }
            
            .toolbar {
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
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView()) {
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

struct PersonalInformationView: View {
    var body: some View {
        VStack(spacing: 20) {
        
            Text("Personal Information")
                .font(.system(size: 36, weight: .semibold, design: .default))
                .padding(.bottom, 240)

            VStack(spacing: 15) {
                NavigationLink(destination: ChangeUsernameView()) {
                    HStack {
                        Text("Change Username")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                }

                NavigationLink(destination: ChangePasswordView()) {
                    HStack {
                        Text("Change Password")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                }

                NavigationLink(destination: ChangeEmailView()) {
                    HStack {
                        Text("Change Email")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                }

                NavigationLink(destination: ChangeProfilePictureView()) {
                    HStack {
                        Text("Change Profile Picture")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                }
            }
            .padding(.horizontal)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.white.ignoresSafeArea())
    }
}


struct ChangeUsernameView: View {
    @State private var username = ""
    @State private var showConfirmation = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Change Username")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)
            
            TextField("Enter new username", text: $username)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                showConfirmation = true
            }) {
                Text("Confirm")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmation) {
                Alert(title: Text("All set!"), message: Text("Username updated"), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
    }
}

struct ChangePasswordView: View {
    @State private var password = ""
    @State private var showConfirmation = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Change Password")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)
            
            SecureField("Enter new password", text: $password)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                showConfirmation = true
            }) {
                Text("Confirm")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmation) {
                Alert(title: Text("All set!"), message: Text("Password updated"), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
    }
}

struct ChangeEmailView: View {
    @State private var email = ""
    @State private var showConfirmation = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Change Email")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)
            
            TextField("Enter new email", text: $email)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                showConfirmation = true
            }) {
                Text("Confirm")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmation) {
                Alert(title: Text("All set!"), message: Text("Email updated"), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
    }
}

struct ChangeProfilePictureView: View {
    @State private var selectedAvatar: String? = nil
    @State private var showConfirmation = false
    private let avatars = ["person.circle.fill", "star.fill", "heart.fill", "flame.fill"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Change Profile Picture")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)
            
            HStack(spacing: 15) {
                ForEach(avatars, id: \.self) { avatar in
                    Image(systemName: avatar)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(selectedAvatar == avatar ? .blue : .gray)
                        .onTapGesture {
                            selectedAvatar = avatar
                        }
                }
            }
            .padding(.vertical)
            
            Button(action: {
                showConfirmation = true
            }) {
                Text("Confirm")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmation) {
                Alert(title: Text("All set!"), message: Text("Profile picture updated"), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct NotificationsView: View {
    @State private var notificationsEnabled = false
    @State private var showConfirmation = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Notifications")
                .font(.system(size: 36, weight: .semibold))
                .padding(.top, 30)
            
            Toggle("Enable Notifications", isOn: $notificationsEnabled)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: {
                showConfirmation = true
                UserDefaults.standard.set(notificationsEnabled, forKey: "notificationsEnabled")
            }) {
                Text("Confirm")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmation) {
                Alert(title: Text("All set!"), message: Text("Notification settings saved"), dismissButton: .default(Text("OK")))
            }

            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
    }
}
