//
//  ContentView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 10/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            if viewModel.userSession == nil{
                LoginView()
            }else {
                if let user = viewModel.currentUser {
                    DashBoardView(user: user)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel.shared)
    }
}
