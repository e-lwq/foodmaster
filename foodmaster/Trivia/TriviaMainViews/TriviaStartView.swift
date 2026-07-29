import SwiftUI

struct TriviaStartView: View {
    
    @EnvironmentObject var TrivialistViewModel: TriviaViewModel
    @EnvironmentObject var Info: Information
    var qno: Int = 1
    var qno2: CGFloat = 1
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView()){
                            Image(systemName: "house")
                                .padding(20)
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                        }
                    }
                    
                    Spacer()
                    Text("Trivia")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    
                    
                    Text("Highscore: \(Info.trivia_highscore)")
                        .foregroundColor(.black)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    NavigationLink(destination: TriviaView(score: 0, question: TrivialistViewModel.TriviaQ[qno-1], qno: qno, qno2: qno2)){
                        Text("START")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 140, height: 50)
                            .background(Color.init(red: 0.40, green: 0.60, blue: 0.98))
                            .cornerRadius(20)
                            .modifier(shadow_modifier())
                    }
                    Spacer()
                    
                    TabBarView(sc: 4)
                    
                }
            }
        }.navigationBarHidden(true)
    }
}

struct TriviaStartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TriviaStartView()
        }.environmentObject(TriviaViewModel())
    }
}
