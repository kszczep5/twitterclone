//
//  Tweet.swift
//  twitter
//
//  Created by Kacper on 30/01/2023.
//

import Foundation

struct Tweet: Identifiable {
    let id = UUID()
    let author: User
    let tweet: String
}
