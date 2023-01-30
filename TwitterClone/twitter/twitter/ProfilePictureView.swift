//
//  ProfilePictureView.swift
//  twitter
//
//  Created by Kacper on 28/01/2023.
//

import SwiftUI

struct ProfilePictureView: View {
    var body: some View {
        Image("Avatar")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView()
    }
}
