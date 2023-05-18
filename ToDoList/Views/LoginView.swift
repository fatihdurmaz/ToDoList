//
//  LoginView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import SwiftUI
import AlertToast
import LottieForSwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var showProgressView = false
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                ZStack {
                    HeaderView(title: "Yapılacaklar", subTitle: "Neler yapacaksın?", angle: 15, background: .pink)
                    LottieView(fileName: "todo")
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .offset(y:40)
                }
                
                // Login Form
                Form {
                    HStack {
                        Image(systemName: "mail")
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                    }
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Şifre", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                    }
                    
                    TLButton(title: "Giriş Yap", background: .primary) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y:-75)
                
                
                
                VStack{
                    Text("Henüz kullanmaya başlamadın mı?")
                        .bold()
                    NavigationLink("Yeni Hesap Oluştur", destination: RegisterView())
                }
                .offset(y:-50)
                
                
            }
            .ignoresSafeArea()
            
            if showProgressView {
                ProgressView() // İlerleme göstergesini göster
            }
        }
        .toast(isPresenting: $viewModel.showError) {
            AlertToast(displayMode:.hud,type: .error(.red), title: "Uyarı", subTitle: viewModel.errorMessage)
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
