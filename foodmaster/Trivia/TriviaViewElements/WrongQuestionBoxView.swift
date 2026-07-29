
import SwiftUI

struct WrongQuestionBoxView: View {
    var item: WrongQuestion_info
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
                .modifier(shadow_modifier())
                .padding(.trailing, 5)
            
            VStack(alignment: .leading){
                Text(item.question)
                    .foregroundColor(.black)
                    .frame(maxWidth: 180)
                    .padding(.horizontal, 3)
                
                Text("Your Answer: ")
                Text(item.wrong_ans)
                    .foregroundColor(.red.opacity(0.9))
                    .padding(.bottom, 5)
                
                Text("Correct Answer: ")
                Text(item.correct_ans)
                    .foregroundColor(.green.opacity(0.9))
                
            }.frame(maxWidth: 200, maxHeight: 190)
        }
    }
}

struct WrongQuestionBoxView_Previews: PreviewProvider {
    static var item1 = WrongQuestion_info(question: "sfafsfdafafafafafafafdfdfdfdfddfddfdfdfdf", correct_ans: "dsf", wrong_ans: "asds")
    static var previews: some View {
        WrongQuestionBoxView(item: item1)
    }
}
