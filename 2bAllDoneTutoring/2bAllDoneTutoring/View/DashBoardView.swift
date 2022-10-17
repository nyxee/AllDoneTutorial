//
//  DashBoardView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 15/10/2022.
//

import SwiftUI

struct DashBoardView: View {
    let user: AppUser
    
    @State var searchText: String = ""
    
    @EnvironmentObject var mAuthViewModel: AuthViewModel //access an observable with a shared environment variable.
    @ObservedObject var mTODOViewModel = TODOViewModel() //access an observable normally
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("- AllDone -")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            mAuthViewModel.signOut()
                        } label: {
                            Text("Logout")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                    }//HSTACK
                }//Overlay
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                TODOButtonStack(mTODOViewModel: mTODOViewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if mTODOViewModel.todosFiltered.isEmpty {
                    AddTODOLogo()
                        .padding()
                }
            }//VStack
        }//Zstack
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView(user: appUSer01)
    }
}
