//
//  ContentView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 10/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LoginView()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
