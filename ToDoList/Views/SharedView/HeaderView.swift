//
//  HeaderView.swift
//  ToDoList
//
//  Created by Fatih Durmaz on 9.05.2023.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subTitle : String
    let angle : Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            .padding(.top, 100)
        }
        .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height * 0.5)
        .offset(y:-(UIScreen.main.bounds.height * 0.2))
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subTitle: "Subtitle", angle: 15, background: .blue)
    }
}
