//
//  TLButton.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 9.05.2023.
//

import SwiftUI
import AlertToast

struct TLButton: View {
    let title : String
    let background : Color
    let action : () -> Void

    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(LocalizedStringKey(title))
                    .foregroundColor(.white)
                    .bold()
                    .padding(10)
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Value", background: .blue) {
            // Action
        }
    }
}
