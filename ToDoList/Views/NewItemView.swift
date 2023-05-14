//
//  NewItemView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 5.05.2023.
//

import SwiftUI
import SwiftUISnackbar

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
        .snackbar(isShowing: $viewModel.showError, title: "Uyarı",text:viewModel.errorMessage, style: .warning)
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
