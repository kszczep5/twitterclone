//
//  ProfilePictureView.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

struct ProfilePictureView: View {
    var profilePictureName: String
    var body: some View {
        Image(profilePictureName)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView(profilePictureName: "Avatar")
    }
}
