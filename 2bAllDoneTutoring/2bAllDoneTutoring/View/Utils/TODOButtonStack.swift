//
//  TODOButtonStack.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 17/10/2022.
//

import SwiftUI

struct TODOButtonStack: View {
    
    @ObservedObject var mTODOViewModel: TODOViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                TODOButton(buttonType: .all, mTODOViewModel: mTODOViewModel)
                TODOButton(buttonType: .groceries, mTODOViewModel: mTODOViewModel)
                TODOButton(buttonType: .work, mTODOViewModel: mTODOViewModel)
                TODOButton(buttonType: .school, mTODOViewModel: mTODOViewModel)
                TODOButton(buttonType: .home, mTODOViewModel: mTODOViewModel)
                TODOButton(buttonType: .personal, mTODOViewModel: mTODOViewModel)
                TODOButton(buttonType: .extra, mTODOViewModel: mTODOViewModel)
    
            }
        }
    }
}

struct TODOButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        TODOButtonStack(mTODOViewModel: TODOViewModel())
    }
}

struct TODOButton: View {
    
    let buttonType: SelectedButton
    @ObservedObject var mTODOViewModel: TODOViewModel
    
    var body: some View {
        Button {
            mTODOViewModel.filterTODOSelected = buttonType
            
            if mTODOViewModel.filterTODOSelected != .all {
                mTODOViewModel.todosFiltered = mTODOViewModel.todos.filter({ todo in
                    return todo.TODOType == mTODOViewModel.filterTODOSelected.rawValue
                })
            } else {
                mTODOViewModel.todosFiltered = mTODOViewModel.todos
            }
            
        } label: {
            Text("\(buttonType.getValue())")
                .foregroundColor(mTODOViewModel.filterTODOSelected == buttonType ? .white : Color(.systemGray))
                .frame(width: 100, height: 40)
                .background(buttonType == mTODOViewModel.filterTODOSelected ? Color("lightBlue") : Color(.systemGray6))
                .cornerRadius(20)
        }

    }
}
