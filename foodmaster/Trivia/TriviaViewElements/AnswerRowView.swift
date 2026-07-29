
import SwiftUI

struct AnswerRowView: View {
    
    @EnvironmentObject var TrivialistViewModel: TriviaViewModel
    var question: Question_info
    var answer: String
    var correct : Bool
    var selected: Bool
    let corr_color = Color.green.opacity(0.3)
    let wrong_color = Color.red.opacity(0.3)
    
    var body: some View {
            ZStack{
                Rectangle()
                //.cornerRadius(15)
                    .frame(width: 165, height: 90)
                    .foregroundColor(selected ? (correct ? corr_color : wrong_color) : Color.init(red: 0.82, green: 0.66, blue: 0.97))
                    .cornerRadius(15)
                    .modifier(shadow_modifier())
                
                HStack{
                    Text(answer)
                        .foregroundColor(.black)
                    
                    if selected{
                        Image(systemName: correct ? "checkmark.circle" : "xmark.circle")
                            .foregroundColor(correct ? .green : .red)
                    }
                }
            }
    }
}

struct AnswerRowView_Previews: PreviewProvider {
    static var answer1 = "england"
    static var question1 = Question_info(question: "adsfas", options: ["a","b","c","d"], answer: 1)
    static var previews: some View {
        NavigationView{
            AnswerRowView(question: question1, answer: answer1, correct: false, selected: false)
        }.environmentObject(TriviaViewModel())
    }
}


/*
 cannot append wrong items to TrivialistViewModel.WrongQuestions
 */
