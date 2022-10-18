//
//  AddTODOLogo.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 17/10/2022.
//

import SwiftUI

struct AddTODOLogo: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .background(colorScheme == .dark ? .clear : .black)
                .cornerRadius(50)
            
            if #available(iOS 16.0, *) {
                Text("Add Your First TODO")
                    .background(colorScheme == .dark ? .clear : .white)
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
            } else {
                // Fallback on earlier versions
                Text("Add Your First TODO")
                    .background(colorScheme == .dark ? .clear : .white)
                    .font(.system(size: 25))
            }
        }
    }
}

struct AddTODOLogo_Previews: PreviewProvider {
    static var previews: some View {
        AddTODOLogo()
    }
}
