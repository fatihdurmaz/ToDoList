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
            VStack(){
                if let user = viewModel.user {
                    List {
                        HStack{
                            Image(systemName: "person")
                                .foregroundColor(.blue)
                            Text("Ad Soyad:")
                        }
                        HStack {
                            Image(systemName: "mail")
                                .foregroundColor(.blue)
                            Text("Email:")
                            Text(user.email)
                        }
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                            Text("Üyelik Tarihi:")
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                            
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .toolbar{
                Button {
                    viewModel.logout()
                } label: {
                    HStack {
                        Text("Çıkış Yap")
                    }
                }
            }
            .navigationTitle("Hesabım")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
