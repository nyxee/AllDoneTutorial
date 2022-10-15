//
//  AuthViewModel.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 15/10/2022.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?
    @Published var currentUser: AppUser?
    
    static let shared = AuthViewModel()
    
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: AppUser.self) else { return }
            self.currentUser = user
        }
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Login Failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, firstName: String, lastName: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Register Failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            
            let data = ["uid": user.uid,
                        "firstName": firstName,
                        "lastName": lastName,
                        "email": email]
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                print("Successfuly uploaded dats")
                self.userSession = user
                self.fetchUser()
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }

}
