//
//  HomeView.swift
//  ClubVibe
//
//  Created by iMac1 on 21/02/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var description: [clubcard] = []
    
    init() {
        _description = State(initialValue: performance())
    }
    
//    @State var isLiked: Bool = false
//    @State var likeCount: Int = Int.random(in: 0...1000)
    
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
                        }.padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 20))
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
                    ScrollView {
                        ForEach(description.indices, id: \.self) { index in
                            ZStack {
                                Rectangle()
                                    .frame(height: 150)
                                    .cornerRadius(15)
                                    .foregroundStyle(Color.gray)
                                    .opacity(0.1)
                                HStack {
                                    Image(description[index].name)
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
                                                    description[index].isliked.toggle()
                                                    description[index].likeCount += description[index].isliked ? 1 : -1
//                                                    likeCount += isLiked ? 1 : -1
                                                } label: {
                                                    Image(systemName: description[index].isliked ? "heart.fill" : "heart")
                                                        .resizable()
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(description[index].isliked ? .red : .black)
                                                }
                                                Text("\(description[index].likeCount)")
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
                           
                        }
                    }.padding()
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
                    }.padding(.top, -43)
                    footerView()
                }
                .ignoresSafeArea()
            }.toolbar(.hidden)
    }
    
    func performance() -> [clubcard] {
        var img: [clubcard] = []
        for i in event {
            img.append(clubcard(name: "\(i)", isliked: false))
//            likeCount += isLiked ? 1 : -1
        }
        return img
    }
    
}

#Preview {
    HomeView()
}
