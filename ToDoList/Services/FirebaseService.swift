//
//  FirebaseService.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 13.05.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseService {
    
    // Kullanıcının email ve şifresiyle giriş yapmasını sağlar
    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    // Yeni bir kullanıcı oluşturur
    func signUp(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    // Kullanıcının çıkış yapmasını sağlar
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    // Veri nesnesini Firestore veritabanındaki belirtilen koleksiyona ekler
    func addData<T: Codable>(data: T, toCollection collection: String, completion: @escaping (Error?) -> Void) {
        do {
            let db = Firestore.firestore()
            try db.collection(collection).addDocument(from: data, completion: completion)
        } catch {
            completion(error)
        }
    }
    
    // Veri nesnesini Firestore veritabanındaki koleksiyonda günceller
    func updateData<T: Codable & Identifiable>(data: T, inCollection collection: String, completion: @escaping (Error?) -> Void) {
        do {
            let db = Firestore.firestore()
            try db.collection(collection).document(data.id as! String).setData(from: data, merge: true, completion: completion)
        } catch {
            completion(error)
        }
    }
    
    // Belirtilen veri nesnesini Firestore veritabanından siler
    func deleteData<T: Identifiable>(data: T, fromCollection collection: String, completion: @escaping (Error?) -> Void) {
        let db = Firestore.firestore()
        db.collection(collection).document(data.id as! String).delete(completion: completion)
    }
    
    // Belirtilen koleksiyondan tüm verileri çeker ve veri nesnelerini Codable olarak decode eder
    func fetchData<T: Codable>(fromCollection collection: String, completion: @escaping ([T]?, Error?) -> Void) {
        let db = Firestore.firestore()
        db.collection(collection).getDocuments { snapshot, error in
            if let error = error {
                completion(nil, error)
            } else {
                do {
                    let data = try snapshot?.documents.compactMap { document -> T? in
                        try document.data(as: T.self)
                    }
                    completion(data, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
    }
}
