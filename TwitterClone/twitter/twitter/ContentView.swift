//
//  ContentView.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

typealias onClickHandler = (() -> Void)

struct ContentView: View {
    @StateObject private var model = Model()
    @State private var homeClick: onClickHandler = { }
    @State private var tweetClick: onClickHandler = { }
    @State private var currentPageIndex = 1
    @State private var rotationAngle = 0.0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            TabView(selection: $currentPageIndex) {
                UserProfileView(rotationAngle: $rotationAngle.animation(.linear))
                    .tabItem {
                        Image(systemName: "globe")
                    }
                    .tag(0)
                FeedView(homeClick: $homeClick, tweetClick: $tweetClick)
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                    .tag(1)
                
                NewTweetView(currentPageIndex: $currentPageIndex.animation(.easeIn), tweetClick: $tweetClick)
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                    }
                    .tag(2)
            }
            .tint(.white)
            .tabViewStyle(.page)
            Button {
                withAnimation {
                    currentPageIndex = 2
                }
            } label: {
                Image(systemName: "square.and.pencil.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
            }
            .opacity(currentPageIndex != 1 ? 0 : 1).animation(.easeIn, value: currentPageIndex)
            .frame(width: 60, height: 60)
            .padding(.leading, 285)
            .padding(.top, 555)
        }
        .environmentObject(model)
        .padding(.top, 20)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation (.easeIn) {
                        currentPageIndex = 0
                    }
                } label: {
                    ProfilePictureView()
                        .frame(width: 50)
                }
            }
            ToolbarItem(placement: .principal) {
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(.indigo)
                    .rotationEffect(.degrees(rotationAngle))
                    .onTapGesture {
                        withAnimation {
                            rotationAngle += 360.0
                            currentPageIndex = 1
                            homeClick()
                        }
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
                .preferredColorScheme(.dark)
        }
        
    }
}
