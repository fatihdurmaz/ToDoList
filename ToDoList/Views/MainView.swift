//
//  ContentView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @StateObject var viewmodel = MainViewModel()
    
    
    var body: some View {
        if viewmodel.isSignedIn, !viewmodel.currentUserId.isEmpty {
            TabView {
                ToDoListView(userId: viewmodel.currentUserId)
                    .tabItem {
                        Label("Yapılacaklar", systemImage: "house")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Hesabım", systemImage: "person.circle")
                    }
            }
            
        }else{
            LoginView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
