//
//  UserTextFieldStyle.swift
//  twitter
//
//  Created by Kacper on 31/01/2023.
//

import SwiftUI

struct UserTextField: View {
    @Binding var name: String
    var defaultText: String
    var size: CGFloat
    var isDisabled: Bool
    var color: Color
    var textAlignment: TextAlignment
    var body: some View {
        TextField(
            defaultText,
            text: $name,
            axis: .vertical
        )
        .disabled(isDisabled)
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .multilineTextAlignment(textAlignment)
        .font(.system(size: size))
        .bold()
        .foregroundColor(color)
    }
}

struct UserTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        UserTextField(name: .constant("Kacper"), defaultText: " ", size: 50, isDisabled: false, color: .white, textAlignment: .center)
    }
}
