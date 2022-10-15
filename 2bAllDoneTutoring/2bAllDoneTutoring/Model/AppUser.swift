//
//  AppUser.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 15/10/2022.
//

import Foundation
import FirebaseFirestoreSwift

struct AppUser: Identifiable, Decodable {
//    var id: ObjectIde÷ntifier
    @DocumentID var id: String?

    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    
//    var isCurrentUser: Bool {
//        
//    }

}
