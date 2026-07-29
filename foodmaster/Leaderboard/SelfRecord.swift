//
//  SelfRecord.swift
//  foodmaster
//
//  Created by Elizabeth Lam on 23/12/2022.
//

import SwiftUI

struct SelfRecord: View {
    @EnvironmentObject var Info: Information
    let ind: Int
    
    var body: some View {
        ZStack{
            Rectangle()
                //.frame(width: 390, height: 60)
                .foregroundColor(.init(red: 0.85, green: 0.85, blue: 0.85))
            HStack{
                Text("\(ind)")
                    .fontWeight(.bold)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                    
                Image(Info.ranks[Info.r])
                    .resizable()
                    .frame(width: 65, height: 65)
                
                Text("You")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .frame(maxWidth: 180, maxHeight: 30, alignment: .leading)
                    .foregroundColor(.black)
                
                VStack(spacing: 1){
                    Text(Info.ranks[Info.r])
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .offset(x: 10)
                    
                    HStack(spacing: 0){
                        Text("\(Int(Info.xp))")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: 60, maxHeight: 5, alignment: .trailing)
                        Text(" xp")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal,15)
        }.frame(width: 400, height: 70)
    }
}

struct SelfRecord_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelfRecord(ind: 200)
        }
        .environmentObject(Information())
    }
}
