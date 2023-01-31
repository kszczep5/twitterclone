//
//  UserProfileView.swift
//  twitter
//
//  Created by Kacper on 29/01/2023.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject private var model: TwitterModel
    @Binding var rotationAngle: Double
    @State private var name: String = "Kacper"
    @State private var username: String = "kacper"
    @State private var profilePicture: String = "Avatar"
    @State private var showingAlert = false
    @State private var isDisabled = true
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 50)
                    .fill(LinearGradient(colors: [.purple, .black], startPoint: .top, endPoint: .bottom))
            }
            .ignoresSafeArea()
            VStack {
                Button {
                    changeProfilePicture()
                } label: {
                    ProfilePictureView(profilePictureName: profilePicture)
                }
                .frame(width: 350, height: 260)
                .padding(.top, 5)
                UserTextField(name: $name, defaultText: "", size: 50, isDisabled: isDisabled, color: .white, textAlignment: .center)
                
                UserTextField(name: $username, defaultText: "", size: 30, isDisabled: isDisabled, color: .gray, textAlignment: .center)
                Spacer()
                Button {
                    updateUser()
                } label: {
                    Text(isDisabled ? "Edit" : "Save")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                }
                .padding([.leading,.trailing], 20)
                .padding([.top, .bottom], 10)
                .background(Color(.systemIndigo))
                .clipShape(Capsule())
                .padding(.bottom, 100)
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Warning"),
                message: Text("Wrong name/username format"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
    
    private func updateUser() {
        name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        username = username.replacingOccurrences(of: " ", with: "")
        if canUpdateUser {
            model.currentUser = User(name: name, username: username, profilePicture: profilePicture)
            rotationAngle += 360
            isDisabled.toggle()
        } else {
            resetUserFields()
            showingAlert.toggle()
        }
    }
    
    private var canUpdateUser: Bool {
        name.count < 16 && name.count > 0 && username.count < 16 && username.count > 0
    }
    
    private func resetUserFields() {
        name = model.currentUser.name
        username = model.currentUser.username
    }
    
    private func changeProfilePicture() {
        if (profilePicture == "Avatar") {
            profilePicture = "Avatar1"
        } else if (profilePicture == "Avatar1") {
            profilePicture = "Avatar"
        }
        model.currentUser = User(name: name, username: username, profilePicture: profilePicture)
    }
}



struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(rotationAngle: .constant(0))
            .preferredColorScheme(.dark)
            .environmentObject(TwitterModel.testData)
    }
}
