//
//  CreateTODOView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 17/10/2022.
//

import SwiftUI

struct CreateTODOView: View {
    
    let user: AppUser
    @ObservedObject var mTODOViewModel: TODOViewModel
    
    @State var title: String = ""
    @State var description: String = ""
    @State var TODOType: String = ""
    @State var completed = false
    
    var body: some View {
        VStack {
            TODOButtonStack(mTODOViewModel: TODOViewModel())
                .padding()
                .padding(.top)
            TODOTextField(text: $title, placeHolder: "TODO...")
                .padding([.horizontal, .bottom])
            
            CustomTextEditor(text: $description, placeholder: Text("Description..."), imageName: "line.3.horizontal", foregroundColor: .gray)
                .padding([.horizontal, .bottom])

            HStack {
                Button {
                    mTODOViewModel.upload(todo: TODO(ownerUid: user.id ?? "", title: title, description: description, TODOType: mTODOViewModel.filterTODOSelected == .all ? "Extra" : mTODOViewModel.filterTODOSelected.rawValue, completed: false))
                    mTODOViewModel.showCreateTODOView = false
                } label: {
                    CreateTODOButton()
                }
                
                Button {
                    mTODOViewModel.showCreateTODOView = false
                } label: {
                    CancelTODOButton()
                }
            }
            Spacer()
        }//VStack
        .frame(width: UIScreen.main.bounds.size.width - 100, height: 360)
        .background(Color(.systemGray5))
        .cornerRadius(25)
    }
}

struct CreateTODOView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTODOView(user: appUSer01, mTODOViewModel: TODOViewModel())
    }
}

struct CreateTODOButton: View {
    var body: some View {
        Text("Create")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(Color.blue.opacity(0.6))
            .clipShape(Capsule())
    }
}

struct CancelTODOButton: View {
    var body: some View {
        Text("Cancel")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 100, height: 50)
            .background(Color.red.opacity(0.6))
            .clipShape(Capsule())
    }
}
