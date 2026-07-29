
import SwiftUI

struct TriviaView: View {
    
    @EnvironmentObject var TrivialistViewModel: TriviaViewModel
    @State var score: Int
    var question: Question_info
    //@State var checked = false
    let qno: Int
    let qno2: CGFloat

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
                                NavigationLink(destination: TriviaCheckView(score: question.answer==0 ? score+1: score, question: TrivialistViewModel.TriviaQ[qno-1], chosen: 0, qno: qno, qno2: qno2)){
                                    AnswerRowView(question: question, answer: question.options[0], correct: question.answer==0, selected: false)
                                }
                                /*.onTapGesture{
                                    if question.answer != 0{
                                        TrivialistViewModel.WrongQuestions.append(WrongQuestion_info(question: question.question, correct_ans: question.options[question.answer], wrong_ans: question.options[0]))
                                    }
                                }*/
                                
                                Spacer()
                                
                                NavigationLink(destination: TriviaCheckView(score: question.answer==1 ? score+1: score, question: TrivialistViewModel.TriviaQ[qno-1], chosen: 1, qno: qno, qno2: qno2)){
                                    AnswerRowView(question: question, answer: question.options[1], correct: question.answer==1, selected: false)
                                }
                                /*.onTapGesture{
                                    if question.answer != 1{
                                        TrivialistViewModel.WrongQuestions.append(WrongQuestion_info(question: question.question, correct_ans: question.options[question.answer], wrong_ans: question.options[1]))
                                    }
                                }*/
                                
                                Spacer()
                            }
                            
                            HStack{
                                Spacer()
                                NavigationLink(destination: TriviaCheckView(score: question.answer==2 ? score+1: score, question: TrivialistViewModel.TriviaQ[qno-1], chosen: 2, qno: qno, qno2: qno2)){
                                    AnswerRowView(question: question, answer: question.options[2], correct: question.answer==2, selected: false)
                                }
                                /*.onTapGesture{
                                    if question.answer != 2{
                                        TrivialistViewModel.WrongQuestions.append(WrongQuestion_info(question: question.question, correct_ans: question.options[question.answer], wrong_ans: question.options[2]))
                                    }
                                }*/
                                 
                                Spacer()
                                
                                NavigationLink(destination: TriviaCheckView(score: question.answer==3 ? score+1: score, question: TrivialistViewModel.TriviaQ[qno-1], chosen: 3, qno: qno, qno2: qno2)){
                                    AnswerRowView(question: question, answer: question.options[3], correct: question.answer==3, selected: false)
                                }
                                /*.onTapGesture{
                                    if question.answer != 3{
                                        TrivialistViewModel.WrongQuestions.append(WrongQuestion_info(question: question.question, correct_ans: question.options[question.answer], wrong_ans: question.options[3]))
                                    }
                                }*/
                                
                                Spacer()
                            }
                        }
                        .padding(30)
                        .ignoresSafeArea()
                        .background(Color.init(red: 0.78, green: 0.87, blue: 0.97))
                }
            }
        }.navigationBarHidden(true)
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var question1 = Question_info(question: "sdafd", options: ["1", "2", "3", "4"], answer: 1)
    static var previews: some View {
        NavigationView{
            TriviaView(score: 1, question: question1, qno: 7, qno2: 7)
        }.environmentObject(TriviaViewModel())
    }
}
