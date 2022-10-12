//
//  UserTextField.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 12/10/2022.
//

import SwiftUI

struct UserTextField: View {
    
    @Binding var text: String
    let placeHolder: String
    
    var body: some View {
        CustomTextField(text: $text, placeHolder: Text(placeHolder), imageName: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(20)
            .foregroundColor(.white)
    }
}

struct UserTextField_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            BackgroundGradientView()
            UserTextField(text: .constant(""), placeHolder: "User")
        }
    }
}
