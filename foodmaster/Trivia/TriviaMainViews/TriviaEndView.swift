import SwiftUI

struct TriviaEndView: View {
    @EnvironmentObject var TrivialistViewModel: TriviaViewModel
    @EnvironmentObject var Info: Information
    @EnvironmentObject var LlistViewModel: LViewModel
    
    var score: Int
    @State var flag=false
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    NavigationLink(destination: TriviaStartView()){
                        Text("Quit")
                            .foregroundColor(.blue)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.leading, 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack{
                        Text("Trivia")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Congratulations!")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.init(red: 0.12, green: 0.12, blue: 0.76))
                        
                        Text("You completed the trivia!")
                            .font(.title2)
                            .foregroundColor(Color.init(red: 0.12, green: 0.12, blue: 0.76))
                            .padding(.bottom, 10)
                        
                        Text("Final Score: \(score)/5")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.init(red: 0.12, green: 0.54, blue: 0.12))
                    }
                    
                    Text("XP Gained: \(3*score)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    //xp and rank badge
                    Text("New XP and Rank")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(red: 0.6, green: 0.24, blue: 0.4))
                        .padding()
                    
                    Image(Info.ranks[Info.r])
                        .resizable()
                        .frame(width:200, height: 200)
                        .padding(-25)
                    
                    CompleteProgressBar()
                    
                    /*Button{
                        saveProgress(s: CGFloat(score))
                    }label:{
                        ZStack{
                            Rectangle()
                                .frame(width:260, height: 70)
                                .foregroundColor(.blue)
                                .cornerRadius(20)
                            Text("Save Progress")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                    .padding(30)
                    .disabled(flag)*/
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    
                    /*if TrivialistViewModel.WrongQuestions.count>0{
                        VStack{
                            Text("Questions you got wrong:")
                                .font(.title3)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(10)
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(TrivialistViewModel.WrongQuestions){item in
                                        WrongQuestionBoxView(item: item)
                                    }
                                }.frame(height: 220)
                            }
                        }
                    }*/
                    
                    //Spacer()
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            saveProgress(s: CGFloat(score))
            
            //LlistViewModel.updateRecord(userID: Info.userID, name: Info.username, xp: Int(Info.xp), rank: Info.ranks[Info.r])
        }
    }
    
    func saveProgress(s:CGFloat){
        Info.update_xp(add: s*Info.trivia_factor)
        Info.update_triviahighscore(score: score)
        Info.update_trivia_xp(add: s*Info.trivia_factor)
        LlistViewModel.updateRecord(userID: Info.userID, name: Info.username, xp: Int(Info.xp), rank: Info.ranks[Info.r], trivia_xp: Int(Info.trivia_xp))
        flag=true
    }
}

struct TriviaEndView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TriviaEndView(score: 4)
        }
        .environmentObject(TriviaViewModel())
        .environmentObject(Information())
        .environmentObject(LViewModel())
    }
}
