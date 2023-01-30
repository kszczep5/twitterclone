//
//  TweetView.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

struct TweetView: View {
    var name: String
    var uName: String
    var tweet: String
    var body: some View {
        HStack (alignment: .top, spacing: 1) {
            ProfilePictureView()
                .frame(width: 80)
            VStack (alignment: .leading, spacing: 2){
                HStack (alignment: .bottom, spacing: 5){
                    Text(name)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                    Image(systemName: "moon.stars.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.white)
                }
                
                Text(uName)
                    .foregroundColor(.gray)
                Text(tweet)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
            }
            .padding(.trailing, 30)
            Spacer()
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(name: "Name", uName: "uName", tweet: "O")
            .preferredColorScheme(.dark)
    }
}
