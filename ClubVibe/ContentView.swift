//
//  ContentView.swift
//  ClubVibe
//
//  Created by iMac1 on 10/02/26.
//

import SwiftUI
var event = ["art", "tech", "music", "sport", "happy", "startup" ]
var eventName = ["Art Exhibition", "Tech Conference", "Music Festival", "Sports Tournament", "Happy Hour", "Startup Meetup" ]
var clubName = ["Art Club", "Tech Club", "Music Club", "Sports Club", "Happy Club", "Startup Club" ]
var date = ["Feb 26 - 2:00 PM", "Mar 27 - 11:00 AM", "Apr 11 - 9:00 AM", "Apr 29 - 10:30 AM", "May 12 - 2:00 PM", "May 22 - 4:00 PM" ]
var brief = ["Explore Students Art", "Join Us for a Tech Talk", "Enjoy a Music Festival", "Watch the Sports Tournament", "Enjoy a Happy Hour", "Join a Startup Meetup"]

struct ContentView: View {
    
    @State var isLiked: Bool = false
    @State var likeCount: Int = Int.random(in: 0...1000)
    
    var body: some View {
            NavigationStack {
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(height: 100)
                            .foregroundStyle(Color(red: 170/255, green: 230/255, blue: 176/255))
                        HStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text("ClubVibe")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(Color.black)
                            Spacer()
                            Image(systemName: "bell.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .foregroundStyle(Color.black)
                        }.padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 20))
                    }
                    ZStack {
                        Rectangle()
                            .frame(height: 90)
                            .foregroundStyle(Color.white)
                        HStack {
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .frame( height: 60)
                                    .foregroundStyle(Color(red: 170/255, green: 230/255, blue: 176/255))
                                    .cornerRadius(35)
                                Text("Upcoming")
                                    .font(Font.system(size: 18, weight: .bold))
                                    .foregroundStyle(Color.black)
                            }
                            ZStack {
                                Rectangle()
                                    .frame( height: 60)
                                    .foregroundStyle(Color.gray)
                                    .opacity(0.2)
                                    .cornerRadius(35)
                                Text("Popular")
                                    .font(Font.system(size: 18, weight: .bold))
                                    .foregroundStyle(Color.black)
                            }
                            Spacer()
                        }
                    }
                    .padding(EdgeInsets(top: -15, leading: 0, bottom: -10, trailing: 0))
                    List{
                        ForEach(event.indices, id: \.self) { index in
                            ZStack {
                                Rectangle()
                                    .frame(height: 150)
                                    .cornerRadius(15)
                                    .foregroundStyle(Color.gray)
                                    .opacity(0.1)
                                HStack {
                                    Image("\(event[index])")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 150)
                                        .clipped()
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("\(eventName[index])")
                                            .font(Font.system(size: 20, weight: .semibold))
                                        Text("\(date[index])")
                                            .font(Font.system(size: 14, weight: .regular))
                                            .foregroundStyle(Color.gray)
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundStyle(Color.gray)
                                        Text("\(brief[index])")
                                            .font(Font.system(size: 14, weight: .regular))
                                            .foregroundStyle(Color.gray)
                                        ZStack {
                                            Rectangle()
                                                .frame(width:120, height: 30)
                                                .cornerRadius(50)
                                                .foregroundStyle(Color.gray)
                                                .opacity(0.1)
                                            HStack {
                                                Button {
                                                    isLiked.toggle()
                                                    likeCount += isLiked ? 1 : -1
                                                } label: {
                                                    Image(systemName: isLiked ? "heart.fill" : "heart")
                                                        .resizable()
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(isLiked ? .red: .black)
                                                }
                                                Text("\(likeCount)")
                                                    .font(Font.system(size: 14, weight: .semibold))
                                                    .foregroundStyle(Color.black)
                                                Text("Going")
                                                    .font(Font.system(size: 14, weight: .semibold))
                                                    .foregroundStyle(Color.black)
                                            }
                                        }
                                    }.padding(10)
                                    Spacer()
                                }.cornerRadius(15)
                            }
                        }.listRowSeparator(.hidden)
                    }.listStyle(.plain)
                    ZStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(Color.black)
                        Rectangle()
                            .frame(width: 120,height: 40)
                            .cornerRadius(40)
                            .foregroundStyle(Color(red: 170/255, green: 230/255, blue: 176/255))
                        Text("View All")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                    footerView()
                }
                .ignoresSafeArea()
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
