//
//  LeaderboardRecord.swift
//  foodmaster
//
//  Created by Elizabeth Lam on 22/12/2022.
//

import SwiftUI

struct LeaderboardRecord: View {
    let rank: String
    let name: String
    let xp: Int
    let ind: Int
    
    let gold_color = Color.init(red: 0.996, green: 0.92, blue: 0.6)
    let silver_color = Color.init(red: 0.56, green: 0.56, blue: 0.56)
    let bronze_color = Color.init(red: 0.785, green: 0.496, blue: 0.242)
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 380, height: 70)
                .cornerRadius(10)
                .foregroundColor(Color.init(red: 0.96, green: 0.66, blue: 0.71))
                .modifier(shadow_modifier())
            
            HStack{
                Text("\(ind)")
                    .fontWeight(.bold)
                    .font(.system(size: 35))
                    .foregroundColor(ind==1 ? gold_color : ind==2 ? silver_color : ind==3 ? bronze_color : .black)
                    
                Image(rank)
                    .resizable()
                    .frame(width: 65, height: 65)
                
                Text(name)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .frame(maxWidth: 150, maxHeight: 30, alignment: .leading)
                    .foregroundColor(ind==1 ? gold_color : ind==2 ? silver_color : ind==3 ? bronze_color : .black)
                
                VStack(spacing: 1){
                    Text(rank)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .offset(x: 10)
                    
                    HStack(spacing: 0){
                        Text("\(xp)")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: 50, maxHeight: 5, alignment: .trailing)
                        Text(" xp")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal, 10)
            .frame(alignment: .leading)
        }
        .frame(width: 420, height: 80)
    }
}

struct LeaderboardRecord_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardRecord(rank: "Beginner", name: "abc", xp: 100, ind: 4)
    }
}
