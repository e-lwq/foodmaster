//
//  TGLItemsView.swift
//  foodmaster
//
//  Created by Elizabeth Lam on 24/9/2022.
//

import SwiftUI

struct TGLItemsView: View {
    let item: TGL_info
    
    var body: some View {
            /*Rectangle()
                .frame(width: 350, height: 140)
                .foregroundColor(.init(red: 0.984, green: 0.988, blue: 0.996))
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.7), radius: 2, x: 2, y: 2)*/
            
        HStack{
                VStack{
                    Text(item.title)
                        .frame(width: 310, height: 55)
                        .background(Color.init(red: 0.902, green: 0.957, blue: 0.973))
                        .cornerRadius(20)
                        .foregroundColor(.black)
                    Text(item.address)
                        .frame(width: 310, height: 55)
                        .background(Color.init(red: 0.992, green: 0.957, blue: 0.973))
                        .cornerRadius(20)
                        .foregroundColor(.black)
                }
                .padding(.trailing, -5)
            
            
                Image(systemName: item.completed ? "checkmark.circle" : "circle")
                    .font(.system(size: 25))
                    .foregroundColor(item.completed ? .green: .red)
            }
        .modifier(shadow_modifier())
    }
}

struct TGLItemsView_Previews: PreviewProvider {
    static var item1 = TGL_info(title: "first", address: "dasfs", completed: true)
    static var previews: some View {
        TGLItemsView(item: item1)
    }
}
