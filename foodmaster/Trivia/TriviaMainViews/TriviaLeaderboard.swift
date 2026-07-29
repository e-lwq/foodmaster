import SwiftUI
import Foundation

struct TriviaLeaderboardView: View {
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
                            
                            Text("Trivia Leaderboard")
                                .foregroundColor(.black)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("(Top 200)")
                                .foregroundColor(.black)
                                .font(.title3)
                            
                            ForEach(LlistViewModel.trivia_results){result in
                                NavigationLink(destination: ProfileView()){
                                    TriviaLeaderboardRecord(rank: result.fields.rank, name: result.fields.name, xp: result.fields.trivia_xp, ind: (LlistViewModel.trivia_results.firstIndex(of: result) ?? 0) + 1)
                                    
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
            LlistViewModel.fetch_trivia()
        }
    }
}

struct TriviaLeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TriviaLeaderboardView()
        }
        .environmentObject(LViewModel())
        .environmentObject(Information())
    }
}
