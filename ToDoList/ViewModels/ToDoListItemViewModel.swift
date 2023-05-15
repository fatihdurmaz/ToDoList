//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject {    
    init(){}
    
    func toogleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("yapilacaklar").document(newItem.id).setData(newItem.asDictionary())
    }
}
 
