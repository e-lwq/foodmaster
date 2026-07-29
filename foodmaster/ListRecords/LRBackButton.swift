//
//  LRBackButton.swift
//  foodmaster
//
//  Created by Elizabeth Lam on 24/12/2022.
//

import SwiftUI

struct LRBackButton: View {
    var body: some View {
        NavigationLink(destination: ListRecordsView()){
            HStack{
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue)
                    .font(.system(size: 18))
                Text("List / Records")
                    .font(.title3)
                    .foregroundColor(.blue)
            }.padding(.leading, 5)
            Spacer()
        }.padding(.bottom, 5)
    }
}

struct LRBackButton_Previews: PreviewProvider {
    static var previews: some View {
        LRBackButton()
    }
}
