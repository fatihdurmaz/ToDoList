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
                        HStack {
                            Spacer()
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Spacer()
                                
                        }
                        HStack{
                            Image(systemName: "person")
                                .foregroundColor(.teal)
                            Text("name")
                                
                            Text(user.name)
                                .bold()
                        }
                        HStack {
                            Image(systemName: "mail")
                                .foregroundColor(.teal)
                            Text("Email:")
                            Text(user.email)
                                .bold()
                        }
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.teal)
                            Text("register-date")
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                                .bold()
                                
                            
                        }
                    }
                    .listStyle(.plain)
                }else {
                    ProgressView()
                }
            }
            .toolbar{
                Button {
                    viewModel.logout()
                } label: {
                    HStack {
                        Text("logout")
                    }
                }
            }
            .navigationTitle("account")
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
