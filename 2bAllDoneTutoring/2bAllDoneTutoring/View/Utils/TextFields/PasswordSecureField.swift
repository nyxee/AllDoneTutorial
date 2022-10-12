//
//  CustomTextField.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct PasswordSecureField: View {
    
    @Binding var text: String //Binding also used for stateVriables..
    let placeHolder: String
//    let imageName: String
    var foregroundColor: Color?
    
    var body: some View {
        CustomSecureTextField(text: $text, placeHolder: Text(placeHolder))
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct PasswordSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            PasswordSecureField(text: .constant(""), placeHolder: "Password")
        }
    }
}
