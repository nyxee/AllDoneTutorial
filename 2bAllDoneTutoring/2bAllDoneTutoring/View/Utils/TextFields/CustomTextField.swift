//
//  CustomTextField.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String //Binding also used for stateVriables..
    let placeHolder: Text
    let imageName: String
    var foregroundColor: Color?
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeHolder
                    .foregroundColor(foregroundColor ?? Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(foregroundColor ?? .white)
                
                TextField("", text: $text) //how to reference state variables..
                    .autocapitalization(.none)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            CustomTextField(text: .constant(""), placeHolder: Text("Email"), imageName: "envelope")
        }
    }
}
