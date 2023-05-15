//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage = ""
    @Published var showError:Bool = false
    
    init(){}
    
    func save() {
        guard validate else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users").document(uId).collection("yapilacaklar").document(newId).setData(newItem.asDictionary())

    }
    
    var validate: Bool {
        errorMessage = ""
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Başlık alanını doldurunuz."
            showError = true
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            errorMessage = "Tarih bugünden küçük olamaz."
            showError = true
            return false
        }
        return true
    }
}
  
