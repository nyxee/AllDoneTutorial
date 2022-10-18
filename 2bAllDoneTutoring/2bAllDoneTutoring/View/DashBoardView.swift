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
                        .padding(.top)
                }
                
                ScrollView {
                    VStack(spacing: 15){
                        ForEach(mTODOViewModel.todosFiltered, id: \.id) { todo in
                            
                            if searchText == "" {
                                //TODOView(mTODO: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), mTODOViewModel: mTODOViewModel)
                                show(todo: todo)
                            }else {
                                if todo.title.lowercased().contains(searchText.lowercased()) ||
                                    todo.description.lowercased().contains(searchText.lowercased()) {
                                    //TODOView(mTODO: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), mTODOViewModel: mTODOViewModel)
                                    show(todo: todo)
                                }
                            }
                        }//ForEach
                    }//VStack
                }//ScrollView
            }//VStack
            .overlay { //Floating Action Button (Name of this view in Android)..
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button {
                            mTODOViewModel.showCreateTODOView = true
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .frame(width: 60, height: 60)
                                .background(Color("lightBlue"))
                                .cornerRadius(20)
                        }
                        .padding(30)
                    }
                }
            }//Overlay
            
            if mTODOViewModel.showCreateTODOView {
                BlankView()
                CreateTODOView(user: user, mTODOViewModel: mTODOViewModel)
            }
        }//Zstack
    }
    
    //@ViewBuilder  func show(todo: TODO) -> some View //[[[[ Maybe i should change the function definition to that??]]]
    func show(todo: TODO) -> some View{
        //return??
        TODOView(mTODO: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), mTODOViewModel: mTODOViewModel)
        
        //TODOView(mTODO: todo, mTODOViewModel: mTODOViewModel)
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView(user: appUSer01)
    }
}
