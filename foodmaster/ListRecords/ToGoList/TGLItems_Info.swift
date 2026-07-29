import Foundation

struct TGL_info: Identifiable{
    let id: String
    let title: String
    let address: String
    var completed: Bool
    
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

