//
//  twitterApp.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

@main
struct TwitterApp: App {
    @StateObject private var model = TwitterModel.testData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(model)
            .preferredColorScheme(.dark)
        }
    }
}
