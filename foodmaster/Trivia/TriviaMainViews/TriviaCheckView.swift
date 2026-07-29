
import SwiftUI

struct TriviaCheckView: View {
    
    @EnvironmentObject var TrivialistViewModel: TriviaViewModel
    
    @State var score: Int
    var question: Question_info
    var chosen: Int
    let qno: Int
    let qno2: CGFloat
    
    var question1 = Question_info(question: "sdafd", options: ["1", "2", "3", "4"], answer: 1)
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        NavigationLink(destination: TriviaStartView()){
                            Text("Quit")
                                .foregroundColor(.blue)
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Score: "+String(score)+"/5")
                            .foregroundColor(.black)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.trailing, 20)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    Text("Trivia")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.top, 30)
                    
                    Trivia_ProgressBar(corr: qno2)
                    
                    Text(question.question)
                        .foregroundColor(.black)
                        .font(.title3)
                        .padding(.bottom, 20)
                        .frame(width: 400, height: 150)
                        .background(.white)
                        .padding(.bottom)
                    
                    VStack{
                        HStack{
                            Spacer()
                            CheckAnswerRowView(question: question, answer: question.options[0], correct: 0==question.answer, selected: 0==chosen)
                            
                            Spacer()
                            
                            CheckAnswerRowView(question: question, answer: question.options[1], correct: 1==question.answer, selected: 1==chosen)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            CheckAnswerRowView(question: question, answer: question.options[2], correct: 2==question.answer, selected: 2==chosen)
                            
                            Spacer()
                            
                            CheckAnswerRowView(question: question, answer: question.options[3], correct: 3==question.answer, selected: 3==chosen)
                            
                            Spacer()
                        }
                    }
                    .padding(30)
                    .ignoresSafeArea()
                    .background(Color.init(red: 0.78, green: 0.87, blue: 0.97))
                    
                    if qno < 5{
                        NavigationLink(destination: TriviaView(score: score, question: TrivialistViewModel.TriviaQ[qno], qno: qno+1, qno2: qno2+1)){
                            Text("Next")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 140, height: 50)
                                .background(Color.init(red: 0.40, green: 0.60, blue: 0.98))
                                .cornerRadius(20)
                                .modifier(shadow_modifier())
                        }
                    }else{
                        NavigationLink(destination: TriviaEndView(score: score)){
                            Text("Done")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 140, height: 50)
                                .background(Color.init(red: 0.40, green: 0.60, blue: 0.98))
                                .cornerRadius(20)
                                .modifier(shadow_modifier())
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}

struct TriviaCheckView_Previews: PreviewProvider {
    static var question1 = Question_info(question: "sdafd", options: ["1", "2", "3", "4"], answer: 1)
    static var previews: some View {
        NavigationView{
            TriviaCheckView(score: 1, question: question1, chosen: 2, qno: 7, qno2: 7)
        }.environmentObject(TriviaViewModel())
    }
}
