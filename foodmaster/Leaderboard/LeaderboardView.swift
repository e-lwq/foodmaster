//
//  LeaderboardView.swift
//  foodmaster
//
//  Created by Elizabeth Lam on 22/12/2022.
//

import SwiftUI
import Foundation

struct LeaderboardView: View {
    @EnvironmentObject var LlistViewModel: LViewModel
    @EnvironmentObject var Info: Information
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    ScrollView{
                        VStack{
                            BackButton()
                            
                            Text("Leaderboard")
                                .foregroundColor(.black)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("(Top 200)")
                                .foregroundColor(.black)
                                .font(.title3)
                            
                            ForEach(LlistViewModel.results){result in
                                NavigationLink(destination: ProfileView()){
                                    LeaderboardRecord(rank: result.fields.rank, name: result.fields.name, xp: result.fields.xp, ind: (LlistViewModel.results.firstIndex(of: result) ?? 0) + 1)
                                    
                                }
                            }
                            
                            Spacer()
                            
                        }
                    }
                    /*.safeAreaInset(edge: .bottom){
                     SelfRecord(ind: (LlistViewModel.userIDs.firstIndex(of: Info.userID) ?? 0) + 1)
                     }*/
                    Spacer()
                    
                    SelfRecord(ind: (LlistViewModel.userIDs.firstIndex(of: Info.userID) ?? 0) + 1)
                }
                
                
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            LlistViewModel.fetch()
            //print(LlistViewModel.allresults)
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LeaderboardView()
        }
        .environmentObject(LViewModel())
        .environmentObject(Information())
    }
}
