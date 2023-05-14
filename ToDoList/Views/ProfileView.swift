//
//  ProfileView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    init() {}
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile View")
            }
            .toolbar{
                Button {
                    
                    do {
                        try Auth.auth().signOut()
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                } label: {
                    HStack {
                        Text("Çıkış Yap")
                    }
                }
            }
            .navigationTitle("Hesabım")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
