//
//  MockData.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 15/10/2022.
//

import Foundation

let appUSer01 = AppUser(id:"1", uid: "1", firstName: "John", lastName: "Parker", email: "jp@gmail.com")

let todo01 = TODO(id:"1", ownerUid: "1", title: "Tomatoes", description: "Must be from Publix", TODOType: "Groceries", completed: false)
let todo02 = TODO(id:"2", ownerUid: "2", title: "Meat", description: "Must be from Publix", TODOType: "Groceries", completed: false)
let todo03 = TODO(id:"3", ownerUid: "3", title: "Do Homework", description: "Must be from Publix", TODOType: "School", completed: true)
let todo04 = TODO(id:"4", ownerUid: "4", title: "Do Homework Again", description: "Must be from Publix", TODOType: "School", completed: false)
let todo05 = TODO(id:"5", ownerUid: "2", title: "Pork", description: "", TODOType: "Groceries", completed: true)

let todoList = [todo01, todo02, todo03, todo04, todo05]
