//
//  CompleteProgressBar.swift
//  foodmaster
//
//  Created by Elizabeth Lam on 23/12/2022.
//

import SwiftUI

struct CompleteProgressBar: View {
    @EnvironmentObject var Info: Information
    
    var body: some View {
        ZStack{
            if Info.r < 5{
                ProgressBar(percent: Info.xp/Info.rank_xp[Info.r]*100)
            }
            HStack{
                Text("           "+"\(Int(Info.xp))/\(Int(Info.rank_xp[Info.r]))xp")
                    .foregroundColor(.white)
                    .italic()
                
                Spacer()
                Text(String(Info.ranks[Info.r])+"            ")
                    .foregroundColor(.black)
                    .italic()
            }
        }
    }
}

struct CompleteProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CompleteProgressBar()
        }
        .environmentObject(Information())
    }
}
