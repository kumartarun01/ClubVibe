//
//  ClubsScreen.swift
//  ClubVibe
//
//  Created by iMac1 on 11/02/26.
//

import SwiftUI

var DicClubs = ["art": "ART Club","tech": "TECH Club","music": "MUSIC Club","sport": "SPORTS Club", "happy": "HAPPY Club", "startup": "STARTUP Club"
]

struct ClubsScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(height: 100)
                        .foregroundStyle(Color(red: 170/255, green: 230/255, blue: 176/255))
                    HStack {
                        NavigationLink{
                            HomeView()
                        }label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .foregroundStyle(Color.black)
                        }
                        Spacer()
                        Text("Clubs ")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.black)
                        Spacer()
                    }.padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 20))
                }
                clubs()
                Spacer()
                footerView()
            }.ignoresSafeArea()
        }.toolbar(.hidden)
    }
}

var column1 = [
    GridItem(.flexible(minimum: 150, maximum: .infinity)),
    GridItem(.flexible(minimum: 150, maximum: .infinity))
]

struct clubs: View {
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: column1, spacing: 1) {
                    ForEach(DicClubs.sorted(by: <), id: \.key) { key, value in
                        ZStack {
                            Rectangle()
                                .frame(height: 150)
                                .cornerRadius(10)
                                .foregroundStyle(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
                                .clipped()
                            VStack {
                                Image("\(key)")
                                    .resizable()
                                    .frame(height: 100)
                                    .clipped()
                                Text("\(value)")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(Color.black)
                                    .padding()
                            }
                        }
                        .cornerRadius(10)
                        .padding(10)
                    }
                }
            }
        }
    }
}

#Preview {
    ClubsScreen()
}
