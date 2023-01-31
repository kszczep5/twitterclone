//
//  NewTweetView.swift
//  twitter
//
//  Created by Kacper on 29/01/2023.
//

import SwiftUI

struct NewTweetView: View {
    @EnvironmentObject private var model: TwitterModel
    @Binding var currentPageIndex: Int
    @State private var textTemp: String = ""
    @State private var isDisabled = false
    
    var body: some View {
        VStack (alignment: .leading){
            HStack (alignment: .top, spacing: 1) {
                ProfilePictureView(profilePictureName: model.currentUser.profilePicture)
                    .frame(width: 80)
                VStack (alignment: .leading, spacing: 2) {
                    authorNameHeader
                    Text(model.currentUser.displayUserName)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    UserTextField(name: $textTemp, defaultText: "What's happening?", size: 18, isDisabled: isDisabled, color: .blue, textAlignment: .leading)
                }
                .padding(.trailing, 30)
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    addTweet()
                } label: {
                    Text("Tweet")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(.systemIndigo))
                .clipShape(Capsule())
                .padding()
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            isDisabled = false
        }
        .padding(.top, 5)
        
    }
    
    private var authorNameHeader: some View {
        HStack (alignment: .bottom, spacing: 5){
            Text(model.currentUser.name)
                .font(.subheadline).bold()
                .foregroundColor(.white)
            Image(systemName: "moon.stars.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundColor(.white)
        }
    }
    
    private func addTweet() {
        if textTemp != "" {
            model.tweets.append(
                .init(
                    author: .init(
                        name: model.currentUser.name,
                        username: model.currentUser.username,
                        profilePicture: model.currentUser.profilePicture
                    ),
                    tweet: textTemp
                )
            )
        }
        textTemp = ""
        isDisabled = true
        currentPageIndex = 1
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(currentPageIndex: .constant(0))
            .preferredColorScheme(.dark)
            .environmentObject(TwitterModel.testData)
    }
}
