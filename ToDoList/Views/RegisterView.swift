//
//  RegisterView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import SwiftUI
import AlertToast
import SwiftUISnackbar

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Kaydol", subTitle: "Yapılacakları düzenlemeye başla", angle: -15, background: .teal)
                
                Form {
                    TextField("Ad Soyad", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Şifre", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Hesap Oluştur", background: .teal) {
                        viewModel.register()
                    }
                    .padding()
                }
                .offset(y:-50)
            }
        }
        .snackbar(isShowing: $viewModel.showError, title: viewModel.errorMessage, style: .warning)
        /*
         .toast(isPresenting: $viewModel.showError) {
         AlertToast(type: .error(.red), title: "Uyarı", subTitle: viewModel.errorMessage)
         }
         */
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
