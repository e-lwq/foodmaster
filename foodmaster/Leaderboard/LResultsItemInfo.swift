import Foundation

struct Record: Hashable, Codable, Identifiable{
    var id: String = ""
    var createdTime: String = ""
    let fields: Field
}

struct Field: Hashable, Codable{
    let userID: String
    let xp: Int
    let rank: String
    let name: String
    let trivia_xp: Int
}

struct records: Hashable, Codable{
    let records: [Record]
}

/*struct L_info: Identifiable{
    let id: String
    
    
    init(id: String = UUID().uuidString, title: String, address: String, completed: Bool){
        self.id = id
        self.title = title
        self.address = address
        self.completed = completed
    }
    
    func updateComplete() -> TGL_info{
        return TGL_info(id: id, title: title, address: address, completed: !completed)
    }
}
*/
