//
//  LoginView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            BackgroundGradientView()
            
            VStack{
                LogoView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
