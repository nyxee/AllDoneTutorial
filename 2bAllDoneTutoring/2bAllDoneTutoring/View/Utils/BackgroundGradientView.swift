//
//  BackgroundGradientView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue.opacity(0.5)]),
                       startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea() //to fill the whole screen
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
