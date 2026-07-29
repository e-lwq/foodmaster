import Foundation

struct WrongQuestion_info: Identifiable{
    let id = UUID().uuidString
    var question: String
    var correct_ans: String
    var wrong_ans: String
}
