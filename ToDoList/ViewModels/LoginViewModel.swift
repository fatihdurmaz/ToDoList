//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showError:Bool = false
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // Hata durumunda yapılacak işlemler
                print(error.localizedDescription)
                self.errorMessage = "Giriş yaparken hata oluştu."
                self.showError = true
            }
        }
    }
        private func validate() -> Bool{
            errorMessage = ""
            showError = false
            guard !email.isEmpty, !password.isEmpty else {
                errorMessage = "Tüm alanları doldurunuz."
                showError = true
                return false
            }
            
            guard email.contains("@") && email.contains(".") else {
                errorMessage = "Geçerli bir email adresi giriniz."
                showError = true
                return false
            }
            return true
        }
        
        private func logout(){
            do {
                try Auth.auth().signOut()
            } catch let error{
                print("Error signing out: \(error.localizedDescription)")
            }
        }
    }
