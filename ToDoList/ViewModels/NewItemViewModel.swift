//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage = ""
    @Published var showError:Bool = false
    
    init(){}
    
    func save() {

    }
    
    var validate: Bool {
        errorMessage = ""
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Başlık alanını doldurunuz."
            showError = true
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            errorMessage = "Tarih bugünden büyük olmalı."
            showError = true
            return false
        }
        return true
    }
}
  
