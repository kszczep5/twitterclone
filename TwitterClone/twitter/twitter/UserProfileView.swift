//
//  UserProfileView.swift
//  twitter
//
//  Created by Kacper on 29/01/2023.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject private var model: Model
    @Binding var rotationAngle: Double
    @State private var name: String = "Kacper"
    @State private var uName: String = "@kacper"
    @State private var showingAlert = false
    @State private var isEditing = false
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 50)
                    .fill(LinearGradient(colors: [.purple, .black], startPoint: .top, endPoint: .bottom))
                
                Spacer()
            }
            .ignoresSafeArea()
            VStack {
                Button {
                } label: {
                    ProfilePictureView()
                        .frame(width: 300)
                        .padding(.top, 20)
                }
                TextField(
                    " ",
                    text: $name,
                    axis: .vertical
                )
                .disabled(!isEditing)
                .textInputAutocapitalization(.sentences)
                .disableAutocorrection(true)
                .multilineTextAlignment(.center)
                .font(.system(size: 50)).bold()
                .foregroundColor(.white)
                
                TextField(
                    " ",
                    text: $uName,
                    axis: .vertical
                )
                .disabled(!isEditing)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .foregroundColor(.gray)
                Spacer()
                Button {
                    model.tempName = name
                    model.tempUName = uName
                    name = model.name
                    uName = model.uName
                    rotationAngle += 360
                    isEditing.toggle()
                } label: {
                    Text(isEditing ? "Save" : "Edit")
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
        .alert(isPresented: $model.alert) {
            Alert(
                title: Text("Warning"),
                message: Text("Wrong name/username format"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(rotationAngle: .constant(0))
            .preferredColorScheme(.dark)
            .environmentObject(Model())
    }
}
