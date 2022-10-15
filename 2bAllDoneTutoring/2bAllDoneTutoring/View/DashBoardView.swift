//
//  DashBoardView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 15/10/2022.
//

import SwiftUI

struct DashBoardView: View {
    let user: AppUser
    
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("DashBoard View")
            
            Button {
                AuthViewModel.shared.signOut()
            } label: {
                Text("Log Out")
            }
            .padding()
        }
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView(user: appUSer01)
    }
}
