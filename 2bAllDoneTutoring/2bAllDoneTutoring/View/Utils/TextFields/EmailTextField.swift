//
//  EmailTextField.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var text: String
    
    var body: some View {
        CustomTextField(text: $text, placeHolder: Text("Email"), imageName: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            EmailTextField(text: .constant("Email"))
        }
    }
}
