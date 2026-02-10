//
//  ContentView.swift
//  ClubVibe
//
//  Created by iMac1 on 10/02/26.
//

import SwiftUI
var event = ["art", "tech", "music", "sport", "happy", "startup" ]
var eventName = ["Art Exhibition", "Tech Conference", "Music Festival", "Sports Tournament", "Happy Hour", "Startup Meetup" ]
var date = ["Feb 26 - 2:00 PM", "Mar 27 - 11:00 AM", "Apr 11 - 9:00 AM", "Apr 29 - 10:30 AM", "May 12 - 2:00 PM", "May 22 - 4:00 PM" ]
var brief = ["Explore Students Art", "Join Us for a Tech Talk", "Enjoy a Music Festival", "Watch the Sports Tournament", "Enjoy a Happy Hour", "Join a Startup Meetup"]
struct ContentView: View {
    var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(height: 100)
                        .foregroundStyle(Color.black)
                    HStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundStyle(Color.white)
                        Spacer()
                        Text("ClubVibe")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.white)
                        Spacer()
                        Image(systemName: "bell.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundStyle(Color.white)
                    }.padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
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
                                .foregroundStyle(Color.black)
                                .cornerRadius(35)
                            Text("Upcoming")
                                .font(Font.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.white)
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
                .padding(EdgeInsets(top: -15, leading: 0, bottom: 0, trailing: 0))
                List{
                    ForEach(event.indices, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .frame(height: 150)
                                .cornerRadius(15)
                                .foregroundStyle(Color.gray)
                                .opacity(0.2)
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
                                            .frame(width:100, height: 30)
                                            .cornerRadius(50)
                                            .foregroundStyle(Color.gray)
                                            .opacity(0.2)
                                        Image(systemName: "")
                                    }
                                }.padding(10)
                                Spacer()
                            }.cornerRadius(15)
                        }
                    }
                }
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("Events")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "tray.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("Clubs")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("Profile")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.black)
                        
                    }
                    Spacer()
                }.padding(20)
            }
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
