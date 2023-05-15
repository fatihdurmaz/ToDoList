//
//  LoginView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import SwiftUI
import AlertToast

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "Yapılacaklar", subTitle: "Neler yapacaksın?", angle: 15, background: .brown)
                
                // Login Form
                Form {
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Şifre", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Giriş Yap", background: .brown) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y:-50)
                
                VStack {
                    Text("Henüz kullanmaya başlamadın mı?")
                        .bold()
                    NavigationLink("Yeni Hesap Oluştur", destination: RegisterView())
                }
                .padding(.bottom, 50)
            }
        }
        .snackbar(isShowing: $viewModel.showError, title: "Uyarı",text:viewModel.errorMessage, style: .warning)
        /*
         .toast(isPresenting: $viewModel.showError) {
         AlertToast(displayMode:.hud,type: .error(.red), title: "Uyarı", subTitle: viewModel.errorMessage)
         }
         */
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
