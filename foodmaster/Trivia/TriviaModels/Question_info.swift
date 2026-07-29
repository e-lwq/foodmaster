import Foundation

struct Question_info: Identifiable{
    let id = UUID().uuidString
    var question: String
    var options: [String]
    var answer: Int
}
