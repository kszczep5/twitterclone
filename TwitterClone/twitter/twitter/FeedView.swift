//
//  FeedView.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject private var model: TwitterModel
    @Binding var homeTap: () -> Void
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(Array(model.tweets.enumerated()), id: \.offset) { index, tweet in
                        VStack {
                            TweetView(tweet: tweet)
                                .padding([.vertical], 10)
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1)
                        }
                        .id(index)
                    }
                }
            }
            .onAppear {
                self.homeTap = {
                    withAnimation {
                        proxy.scrollTo(0)
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(homeTap: .constant({ }))
            .preferredColorScheme(.dark)
            .environmentObject(TwitterModel.testData)
    }
}
