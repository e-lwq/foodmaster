//
//  BackButton.swift
//  foodmaster
//
//  Created by Elizabeth Lam on 24/12/2022.
//

import SwiftUI

struct BackButton: View {
    
    var body: some View {
        NavigationLink(destination: HomeView()){
            HStack{
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue)
                    .font(.system(size: 18))
                Text("Back")
                    .font(.title3)
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding(.leading, 15)
        }
        .padding(.bottom, 5)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
