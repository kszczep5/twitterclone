//
//  NewTweetView.swift
//  twitter
//
//  Created by Kacper on 29/01/2023.
//

import SwiftUI

struct NewTweetView: View {
    @EnvironmentObject private var model: Model
    @Binding var currentPageIndex: Int
    @Binding var tweetClick: onClickHandler
    @State private var textTemp: String = ""
    @State private var isDisabled = false
    var body: some View {
        VStack (alignment: .leading){
            HStack (alignment: .top, spacing: 1) {
                ProfilePictureView()
                    .frame(width: 80)
                VStack (alignment: .leading, spacing: 2){
                    HStack (alignment: .bottom, spacing: 5){
                        Text(model.name)
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                        Image(systemName: "moon.stars.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundColor(.white)
                    }
                    Text(model.uName)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    TextField(
                        "What's happening?",
                        text: $textTemp,
                        axis: .vertical
                    )
                    .onAppear {
                        isDisabled = false
                    }
                    .disabled(isDisabled)
                    .foregroundColor(.blue)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.leading)
                }
                .padding(.trailing, 30)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    model.text = (model.name, model.uName, textTemp)
                    textTemp = ""
                    tweetClick()
                    isDisabled = true
                    currentPageIndex = 1
                } label: {
                    Text("Tweet")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                }
                .padding([.leading,.trailing], 20)
                .padding([.top, .bottom], 10)
                .background(Color(.systemIndigo))
                .clipShape(Capsule())
                .padding()
                .padding(.bottom, 40)
            }
        }
        .padding(.top, 5)
        
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(currentPageIndex: .constant(0), tweetClick: .constant({ }))
            .preferredColorScheme(.dark)
            .environmentObject(Model())
    }
}
