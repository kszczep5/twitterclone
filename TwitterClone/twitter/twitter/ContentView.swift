//
//  ContentView.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: TwitterModel
    @State private var homeTap: () -> Void = { }
    @State private var currentPageIndex = 1
    @State private var rotationAngle = 0.0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            TabView(selection: $currentPageIndex) {
                UserProfileView(rotationAngle: $rotationAngle)
                    .tabItem {
                        Image(systemName: "globe")
                    }
                    .tag(0)
                FeedView(homeTap: $homeTap)
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                    .tag(1)
                
                NewTweetView(currentPageIndex: $currentPageIndex)
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                    }
                    .tag(2)
            }
            .animation(.easeIn, value: currentPageIndex)
            .tint(.white)
            .tabViewStyle(.page)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        currentPageIndex = 2
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                    }
                    .opacity(currentPageIndex != 1 ? 0 : 1)
                    .animation(.easeIn, value: currentPageIndex)
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 25)
                    .padding(.bottom, 45)
                }
                
            }
        }
        .padding(.top, 20)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    currentPageIndex = 0
                } label: {
                    ProfilePictureView(profilePictureName: model.currentUser.profilePicture)
                        .frame(width: 50, height: 50)
                }
            }
            ToolbarItem(placement: .principal) {
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 40)
                    .foregroundColor(.indigo)
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(.easeIn, value: rotationAngle)
                    .onTapGesture {
                        rotationAngle += 360.0
                        currentPageIndex = 1
                        homeTap()
                    }
            }
        }
        .background(.black)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .environmentObject(TwitterModel.testData)
                .preferredColorScheme(.dark)
        }
        
    }
}
