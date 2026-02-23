//
//  ContentView.swift
//  ClubVibe
//
//  Created by iMac1 on 10/02/26.
//

import SwiftUI

struct clubcard: Identifiable {
    var id = UUID()
    var name: String
//    var title: String
    var isliked: Bool
    var likeCount: Int = 0
}

var event = ["art", "tech", "music", "sport", "happy", "startup" ]
var eventName = ["Art Exhibition", "Tech Conference", "Music Festival", "Sports Tournament", "Happy Hour", "Startup Meetup" ]
var clubName = ["Art Club", "Tech Club", "Music Club", "Sports Club", "Happy Club", "Startup Club" ]
var date = ["Feb 26 - 2:00 PM", "Mar 27 - 11:00 AM", "Apr 11 - 9:00 AM", "Apr 29 - 10:30 AM", "May 12 - 2:00 PM", "May 22 - 4:00 PM" ]
var brief = ["Explore Students Art", "Join Us for a Tech Talk", "Enjoy a Music Festival", "Watch the Sports Tournament", "Enjoy a Happy Hour", "Join a Startup Meetup"]

struct ContentView: View {
    @StateObject private var auth = AuthViewModel()
    var body: some View {
        Group {
            if auth.isAuthenticated {
//                TabView {
                    NavigationStack {
                        HomeView()
//                            .toolbar {
//                                ToolbarItem(placement: .topBarTrailing) {
//                                    Button("Logout") { auth.logout()}
//                                    }
//                                }
                            }
//                    .tabItem {
//                        Image(systemName: "house")
//                        Text("Home")
//                    }
//                }
                .tint(.black)
                .ignoresSafeArea()
            } else {
                AuthView(auth: auth)
            }
        }
    }
}


struct footerView: View {
    var body: some View {
            HStack {
                Spacer()
                NavigationLink {
                    ContentView()
                }label: {
                    VStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundStyle(Color.black)
                        Text("Events")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                }
                Spacer()
                NavigationLink {
                    ClubsScreen()
                }label: {
                    VStack {
                        Image(systemName: "tray.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundStyle(Color.black)
                        Text("Clubs")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                }
                Spacer()
                NavigationLink {
                    ProfileScreen()
                }label: {
                    VStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundStyle(Color.black)
                        Text("Profile")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.black)
                        
                    }
                }
                Spacer()
            }.padding(4)
        
    }
}

#Preview {
    ContentView()
}
