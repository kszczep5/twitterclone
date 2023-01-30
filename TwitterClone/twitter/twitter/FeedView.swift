//
//  FeedView.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject private var model: Model
    @Binding var homeClick: onClickHandler
    @Binding var tweetClick: onClickHandler
    @State private var id = 0
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0..<model.tweets.count) { i in
                        VStack {
                            TweetView(name: model.tweets[i].0, uName: model.tweets[i].1, tweet: model.tweets[i].2)
                                .padding([.top,.bottom], 10)
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1)
                        }
                        .id(i)
                    }
                    .id(id)
                }
            }
            .onAppear {
                self.tweetClick = {
                    id += 1
                }
                self.homeClick = {
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
        FeedView(homeClick: .constant({ }), tweetClick: .constant({}))
            .preferredColorScheme(.dark)
            .environmentObject(Model())
    }
}
