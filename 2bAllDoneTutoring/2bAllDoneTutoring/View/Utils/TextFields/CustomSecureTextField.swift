//
//  CustomTextField.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct CustomSecureTextField: View {
    
    @Binding var text: String //Binding also used for stateVriables..
    let placeHolder: Text
//    let imageName: String
    var foregroundColor: Color?
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeHolder
                    .foregroundColor(foregroundColor ?? Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            HStack{
                Image(systemName:  "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(foregroundColor ?? .white)
                
                SecureField("", text: $text) //how to reference state variables..
                    .autocapitalization(.none)
            }
        }
    }
}

struct CustomSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            CustomSecureTextField(text: .constant(""), placeHolder: Text("Password"))
        }
    }
}
