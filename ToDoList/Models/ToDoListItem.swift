//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import Foundation

struct ToDoListItem: Codable,Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
