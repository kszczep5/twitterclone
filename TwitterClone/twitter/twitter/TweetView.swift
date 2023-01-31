//
//  TweetView.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

struct TweetView: View {
    let tweet: Tweet
    
    var body: some View {
        HStack (alignment: .top, spacing: 1) {
            ProfilePictureView(profilePictureName: tweet.author.profilePicture)
                .frame(width: 80)
            VStack (alignment: .leading, spacing: 2) {
                authorNameHeader
                Text(tweet.author.displayUserName)
                    .foregroundColor(.gray)
                Text(tweet.tweet)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
            }
            .padding(.trailing, 30)
            Spacer()
        }
    }
    
    private var authorNameHeader: some View {
        HStack (alignment: .bottom, spacing: 5) {
            Text(tweet.author.name)
                .font(.subheadline).bold()
                .foregroundColor(.white)
            Image(systemName: "moon.stars.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundColor(.white)
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(tweet: .init(author: .init(name: "Kacper", username: "kacper", profilePicture: "Avatar"), tweet: "O"))
            .preferredColorScheme(.dark)
    }
}
