//
//  Model.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import Foundation

class TwitterModel: ObservableObject {
    @Published var currentUser: User
    @Published var tweets: [Tweet]
    
    init(currentUser: User, tweets: [Tweet]) {
        self.currentUser = currentUser
        self.tweets = tweets
    }
}
