//
//  TwitterModel+TestData.swift
//  twitter
//
//  Created by Kacper on 31/01/2023.
//

import Foundation

#if DEBUG
extension TwitterModel {
    static var testData: TwitterModel {
        .init(currentUser: .init(name: "Kacper", username: "kacper", profilePicture: "Avatar"), tweets: [.init(author: .init(name: "Kacper", username: "kacper", profilePicture: "Avatar"), tweet: "Mój pierwszy tweet!")])
    }
}
#endif
