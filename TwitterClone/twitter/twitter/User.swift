//
//  User.swift
//  twitter
//
//  Created by Kacper on 30/01/2023.
//

import Foundation

struct User {
    let name: String
    let username: String
    let profilePicture: String
    
    var displayUserName: String {
        "@" + username
    }
}
