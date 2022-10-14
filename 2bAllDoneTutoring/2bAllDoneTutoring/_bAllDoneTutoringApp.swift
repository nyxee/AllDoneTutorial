//
//  _bAllDoneTutoringApp.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 10/10/2022.
//

import SwiftUI
import Firebase

@main
struct _bAllDoneTutoringApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
