//
//  Model.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import Foundation

class Model: ObservableObject{
    var name: String
    var uName: String
    var tweets: [(String, String, String)]
    var text: (String, String, String) {
        didSet {
            if text.2 != "" {
                tweets.append(text)
            }
        }
    }
    var alert: Bool
    var tempName: String {
        didSet {
            tempName = tempName.trimmingCharacters(in: .whitespacesAndNewlines)
            if (tempName.count > 15 || tempName.count == 0) {
                alert = true
            } else {
                name = tempName
            }
        }
    }
    var tempUName: String {
        didSet {
            tempUName = tempUName.replacingOccurrences(of: " ", with: "")
            if (!tempUName.hasPrefix("@")) {
                tempUName = "@" + tempUName
            }
            if (tempUName.count > 15 || tempUName.count == 1) {
                alert = true
            } else {
                uName = tempUName
            }
        }
    }
    
    init() {
        self.name = "Kacper"
        self.uName = "@kacper"
        self.tweets = [("Kacper","@kacper","Moj pierwszy Tweet!")]
        self.text = ("","","")
        self.alert = false
        self.tempName = ""
        self.tempUName = ""
    }
}
