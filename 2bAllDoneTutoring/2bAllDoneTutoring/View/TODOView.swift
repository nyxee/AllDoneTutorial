//
//  TODOView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 17/10/2022.
//

import SwiftUI

struct TODOView: View {
    
    var mTODO: TODO
    @ObservedObject var mTODOViewModel: TODOViewModel
    
    var body: some View {
        HStack{
            Button {
                if mTODO.completed {
                    mTODOViewModel.unComplete(todoId: mTODO.documentID ?? "")
                } else {
                    mTODOViewModel.complete(todoId: mTODO.documentID ?? "")
                }
            } label: {
                Image(systemName: mTODO.completed ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("lightBlue"))
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(mTODO.title)
                    .font(.system(size: 18))
                
                if mTODO.description != "" {
                    HStack {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color("lightBlue"))
                        
                        Text("\(mTODO.description)")
                            .font(.system(size: 14))
                            .foregroundColor(Color(.systemGray))
                    }
                }
            }//VStack
            .padding(.leading, 10)
            Spacer()
            
            Button {
                mTODOViewModel.delete(todoId: mTODO.documentID ?? "")
            } label: {
                Image(systemName: "x.circle")
                    .foregroundColor(.red)
                    .frame(width: 22, height: 22)
            }
        }//HStack
        .padding(20)
        .frame(width: UIScreen.main.bounds.size.width - 25, height: 70)
        .background(Color(.systemGray6))
        .cornerRadius(20)
        
    }
}

struct TODOView_Previews: PreviewProvider {
    static var previews: some View {
        TODOView(mTODO: todo01, mTODOViewModel: TODOViewModel())
    }
}
