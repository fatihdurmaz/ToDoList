//
//  RegisterView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import SwiftUI
import AlertToast
import SwiftUISnackbar
import LottieForSwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    HeaderView(title: "Kaydol", subTitle: "Yapılacakları düzenlemeye başla", angle: -15, background: .teal)
                    LottieView(fileName: "register")
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .offset(y:40)
                }
                
                Form {
                    HStack {
                        Image(systemName: "person")
                        TextField("Ad Soyad", text: $viewModel.name)
                            .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    }
                    
                    HStack {
                        Image(systemName: "mail")
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                        .autocapitalization(.none)
                    }
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Şifre", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                    }
                    
                    TLButton(title: "Hesap Oluştur", background: .primary) {
                        viewModel.register()
                    }
                    .padding()
                }
                .offset(y:-75)
            }
            .ignoresSafeArea()
        }
         .toast(isPresenting: $viewModel.showError) {
             AlertToast(displayMode:.hud,type: .error(.red), title: "Uyarı", subTitle: viewModel.errorMessage)
         }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
