//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    func delete (id: String) {
        let db = Firestore.firestore()
        
        db.collection("users").document(userID).collection("yapilacaklar").document(id).delete()
    
        
    }
}
