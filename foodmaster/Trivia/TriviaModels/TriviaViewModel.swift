import SwiftUI
import Foundation

class TriviaViewModel: ObservableObject{
    @Published var questions = [
        Question_info(question: "Where do sandwiches originate from?", options: ["England", "Germany", "France", "China"], answer: 0),
        Question_info(question: "Which category does butter belong to?", options: ["Carbohydrates", "Dairy Products", "Vegetables", "Fats/Oils"], answer: 3),
        Question_info(question: "Where is saganaki from?", options: ["Japan", "Greece", "Korea", "Italy"], answer: 1),
        Question_info(question: "Which food considered a delicacy today, was once a working class food?", options: ["Hamburger", "Caviar", "Lobsters", "Pasta"], answer: 2),
        Question_info(question: "Which is the most stolen food in the world?", options: ["Cheese", "Beef", "Crab", "Shark fins"], answer: 0),
        Question_info(question: "How many cups of tea are drunk in the UK every day?", options: ["50 mil", "100 mil", "150 mil", "200 mil"], answer: 1),
        Question_info(question: "How many pairs of chopsticks are used in China a year?", options: ["30 bil", "40 bil", "45 bil", "50 bil"], answer: 2),
        Question_info(question: "How many bottles of champagne are there in a magnum? ", options: ["1", "2", "3", "4"], answer: 1),
        Question_info(question: "Which country is Kaiserschmaarn from?", options: ["Scotland", "Australia", "Brazil", "Germany"], answer: 3),
        Question_info(question: "What are churros traditionally served with?", options: ["Cheese", "Cream", "Honey", "Chocolate"], answer: 3)
    ]
    
    @Published var TriviaQ: [Question_info] = []
    @Published var WrongQuestions: [WrongQuestion_info] = [/*WrongQuestion_info(question: "asf", correct_ans: "afs", wrong_ans: "adsfa"),WrongQuestion_info(question: "asf", correct_ans: "afs", wrong_ans: "adsfa"),WrongQuestion_info(question: "asf", correct_ans: "afs", wrong_ans: "adsfa"),WrongQuestion_info(question: "asf", correct_ans: "afs", wrong_ans: "adsfa")*/]
    
    init(){
        getItems()
    }
    
    func getItems(){
        questions.shuffle()
        for i in 0...4{
            TriviaQ.append(questions[i])
        }
    }
    
    func addItem(item: WrongQuestion_info){
        WrongQuestions.append(item)
    }
}
