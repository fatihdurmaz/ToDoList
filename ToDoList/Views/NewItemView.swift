//
//  NewItemView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import SwiftUI
import SwiftUISnackbar
import AlertToast

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Başlık", text: $viewModel.title)
                    
                    DatePicker("Tarih", selection: $viewModel.dueDate)
                        .datePickerStyle(.graphical)
                    
                    TLButton(title: "Kaydet", background: .pink) {
                        
                        if viewModel.validate {
                            viewModel.save()
                            newItemPresented = false
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Yeni Yapılacak")
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button {
                        newItemPresented = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
        .toast(isPresenting: $viewModel.showError) {
            AlertToast(displayMode:.hud,type: .error(.red), title: "Uyarı", subTitle: viewModel.errorMessage)
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
