//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUISnackbar

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
     @Published var errorMessage = ""
     @Published var showError:Bool = false
    
    init() {}
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.inserUserRecord(id: userId)
        }
    }
    
    private func inserUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        showError = false
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else{
            errorMessage = "Tüm alanları doldurunuz."
            showError = true
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Geçerli bir email adresi giriniz."
            showError = true
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Şifreniz 6 karakter veya daha uzun olmalı."
            showError = true
            return false
        }
        
        return true
    }
}
