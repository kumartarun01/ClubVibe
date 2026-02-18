//
//  EventDetailScreen.swift
//  ClubVibe
//
//  Created by iMac1 on 11/02/26.
//

import SwiftUI

var Member = ["John", "Ram", "Kaptan", "Jennie", "Joe"]

struct EventDetailScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(height: 100)
                        .foregroundStyle(Color(red: 170/255, green: 230/255, blue: 176/255))
                    HStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundStyle(Color.black)
                        Spacer()
                        Text("Art Exhibition")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.black)
                        Spacer()
                    }.padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 20))
                }
                List {
                    ZStack {
                        Rectangle()
                            .frame(height: 430)
                            .foregroundStyle(Color.gray.opacity(0.1))
                            .cornerRadius(20)
                        VStack(alignment: .leading, spacing: 20) {
                            ZStack {
                                Image("art")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 300)
                                    .clipped()
                                HStack {
                                    ZStack {
                                        Rectangle()
                                        .frame(width: 300, height: 50)
                                            .foregroundStyle(Color.orange.opacity(0.8))
                                        Text("Feb 26,2026 - 2:00 PM")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundStyle(Color.white)
                                    }.padding(.top, 200)
                                    Spacer()
                                }
                            }
                            VStack(alignment: .leading) {
                                Text("Explore Students Artworks")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundStyle(Color.black)
                                Rectangle()
                                    .frame(width: 300, height: 1)
                                    .foregroundStyle(Color.gray)
                                Text("Join us for inspiring works by our talented students and showcase of students art in various mediums. Enjoy the art and get inspired!")
                                    .font(.system(size: 16, weight: .regular))
                            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            Spacer()
                        }.cornerRadius(20)
                    }
                    ZStack {
                        Rectangle()
                            .frame(height: 280)
                            .foregroundStyle(Color.white.opacity(0.1))
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
                        HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                HStack(spacing: 20) {
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(Color.red)
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Date")
                                            .font(.system(size: 18, weight: .semibold))
                                        Text("Feb 26,2026 - 2:00 PM")
                                            .font(.system(size: 18, weight: .semibold))
                                    }
                                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundStyle(Color.gray)
                                HStack(spacing: 20) {
                                    Image(systemName: "mappin.and.ellipse")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(Color.blue)
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Location")
                                            .font(.system(size: 18, weight: .semibold))
                                        Text("Shooting Hall")
                                            .font(.system(size: 18, weight: .semibold))
                                    }
                                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundStyle(Color.gray)
                                    HStack(spacing: 20) {
                                        Image(systemName: "person")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                        VStack(alignment: .leading, spacing: 10) {
                                            Text("Hosted By")
                                                .font(.system(size: 18, weight: .semibold))
                                            Text("Art Club")
                                                .font(.system(size: 18, weight: .semibold))
                                        }
                                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            }
                            Spacer()
                        }
                    }.padding(.top, -10)
                        .listRowSeparator(.hidden)
                    ClubDetails()
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                Spacer()
                footerView()
            }.ignoresSafeArea()
        }
    }
}

struct ClubDetails: View {
    var body: some View {
        HStack {
            Text("Managed By")
                .font(Font.system(size: 20, weight: .semibold))
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.gray)
        }
    VStack {
        ZStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundStyle(Color.orange)
                .overlay(RoundedRectangle(cornerRadius: 80).stroke(Color.red, lineWidth: 2))
            Image(systemName: "crown.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .rotationEffect(Angle(degrees: -38))
                .foregroundStyle(Color.yellow)
                .padding(EdgeInsets(top: -30, leading: -45, bottom: 50, trailing: 0))
        }
        Text("Danish")
            .font(.system(size: 16, weight: .regular))
        Text("Leader")
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(Color.gray)
       }
        HStack {
            Text("Club Members")
                .font(Font.system(size: 20, weight: .semibold))
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.gray)
        }
        VStack {
            ForEach(Member, id: \.self) { index in
                HStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(Color.gray)
                    VStack(alignment: .leading, spacing: 5) {
                    Text("\(index)")
                        .font(.system(size: 16, weight: .regular))
                    Text("Member")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color.gray)
                }
            }
         }
       }
    }
}
#Preview {
    EventDetailScreen()
}
