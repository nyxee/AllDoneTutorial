//
//  _bAllDoneTutoringApp.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 10/10/2022.
//

import SwiftUI
//import Firebase                                                   //for method 1.
import FirebaseCore                                                 //for method 2

class AppDelegate: NSObject, UIApplicationDelegate {                //ONLY FOR METHOD 2
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct _bAllDoneTutoringApp: App {
    
    //    init(){                                                   //METHOD 1
    //        FirebaseApp.configure()
    //    }
    
    // register app delegate for Firebase setup                     //METHOD 2
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
