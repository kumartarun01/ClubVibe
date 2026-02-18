//
//  ProfileScreen.swift
//  ClubVibe
//
//  Created by iMac1 on 13/02/26.
//

import SwiftUI

struct ProfileScreen: View {
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
                        Text("Profile")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.black)
                        Spacer()
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundStyle(Color.black)
                    }.padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 20))
                }
                HStack(spacing: 20) {
                    Image("art")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(100)
                        .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black, lineWidth: 3))
                    VStack(alignment:.leading, spacing: 10) {
                        Text("Jonny")
                            .font(.system(size: 20, weight: .bold))
                        Text("jonny123@gmail.com")
                            .font(.system(size: 16, weight: .regular))
                    }
                    Spacer()
                }.padding(10)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color.gray)
                    .opacity(0.4)
                List{
                    ForEach(event.indices, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .frame(height: 100)
                                .cornerRadius(15)
                                .foregroundStyle(Color.gray)
                                .opacity(0.1)
                            HStack {
                                Image("\(event[index])")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                NavigationLink {
                                    ClubsScreen()
                                }label: {
                                    VStack(alignment: .leading, spacing: 15) {
                                        Text("\(clubName[index])")
                                            .font(Font.system(size: 20, weight: .semibold))
                                        Text("Member")
                                            .font(Font.system(size: 14, weight: .regular))
                                            .foregroundStyle(Color.gray)
                                        
                                        
                                    }.padding(10)
                                }
                                Spacer()
                            }.cornerRadius(15)
                        }
                    }.listRowSeparator(.hidden)
                }.listStyle(.plain)
                Spacer()
                footerView()
            }.ignoresSafeArea()
        }
        
    }
}

#Preview {
        ProfileScreen()
}
