//
//  LogoView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150) //The ORder Matters..
            Text("AllDone")
                .foregroundColor(.white)
                .font(.system(size: 25))
                .fontWeight(.semibold)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            BackgroundGradientView()
            LogoView()
        }
    }
}
