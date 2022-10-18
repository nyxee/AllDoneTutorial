//
//  TODOViewModel.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 16/10/2022.
//

//import Foundation
import SwiftUI //To use EnvironmentObject

class TODOViewModel: ObservableObject {
    
    @Published var  todos = [TODO]()
    @Published var showCreateTODOView = false //To show or hide the Floating Button calling CreateTodoView
    @Published var  filterTODOSelected: SelectedButton = .all
    @Published var  todosFiltered = [TODO]()

    @EnvironmentObject var mAuthViewModel: AuthViewModel

    init() {
        loadTODOs()
    }
    
    func loadTODOs() {
        guard let user =  AuthViewModel.shared.currentUser else { return }
        
        let query = COLLECTION_USERS.document(user.id ?? "")
            .collection("to-dos")
            .order(by: "completed", descending: false)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            self.todos = documents.compactMap( { try? $0.data(as: TODO.self) } )
            
            for i in stride(from: 0, to: self.todos.count, by: 1){
                self.todos[i].documentID = documents[i].documentID
            }
            
            self.todosFiltered = self.todos
            if self.filterTODOSelected != .all {
                self.todosFiltered = self.todos.filter({ todo in
                    return todo.TODOType == self.filterTODOSelected.rawValue
                })
            } else { //TODO: this may be unnecessary
                self.todosFiltered = self.todos
            }
        }
    }
    
    func upload(todo: TODO){
        //guard let user = mAuthViewModel.currentUser else { return } //TODO: this is causing an error at the moment.. //No ObservableObject of type AuthViewModel found. A View.environmentObject(_:) for AuthViewModel may be missing as an ancestor of this view.
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let data: [String: Any] = ["title": todo.title,
                                   "description": todo.description,
                                   "TODOType": todo.TODOType,
                                   "completed": todo.completed,
                                   "ownerUid": user.id ?? ""]
        
        COLLECTION_USERS.document(user.id ?? "")
            .collection("to-dos")
            .addDocument(data: data){ error in //I have left this only as an example. We should use the completion as shown in the three functions below.
                if let error = error {
                    print("DEBUG: \(error.localizedDescription)")
                    return
                }
                self.loadTODOs()
            }
    }
    
    func delete(todoId: String){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }

        COLLECTION_USERS.document(uid)
            .collection("to-dos")
            .document(todoId)
            .delete(completion: completion)
    }

    func deleteItem(indexSet: IndexSet){
        indexSet.forEach { i in
            let todoid = todosFiltered[i].documentID!
            delete(todoId: todoid)
        }
        todosFiltered.remove(atOffsets: indexSet)
    }
    
    /**
        TO mark an existing TODO as complete
     */
    func complete(todoId: String){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }

        COLLECTION_USERS.document(uid)
            .collection("to-dos")
            .document(todoId)
            .updateData(["completed": true], completion: completion)
    }
    
    /**
        TO mark an existing TODO as incomplete
     */
    func unComplete(todoId: String){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }

        COLLECTION_USERS.document(uid)
            .collection("to-dos")
            .document(todoId)
            .updateData(["completed": false], completion: completion)
    }
    
    func moveItem(from: IndexSet, to: Int){
        todosFiltered.move(fromOffsets: from, toOffset: to)
    }
    
    func completion(error: Error?){
        if let error = error {
            print("DEBUG: \(error.localizedDescription)")
            return
        }
        self.loadTODOs()
    }
}
