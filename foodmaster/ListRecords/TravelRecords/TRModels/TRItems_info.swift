import Foundation

struct TR_info: Identifiable{
    let emojis=["", "😍", "😋","😐","😖","🤮"]
    
    var id: String
    var title: String
    var address: String
    var emoji_ind: Int
    var em: Int
    var notes: String
    var likes: Int
    var creatorID: String
    
    /*init(id: String = UUID().uuidString, title: String, address: String, emoji_ind: Int, em: Int, notes: String, likes: Int, creatorID: String){
        self.id = id
        self.title = title
        self.address = title
        self.emoji_ind = emoji_ind
        self.em = em
        self.notes = notes
        self.likes = likes
        self.creatorID = creatorID
    }
    
    func updateComplete(title2: String, address2: String, emoji_ind2: Int, em2: Int, notes2: String, likes2: Int, creatorID2: String) -> TR_info{
        return TR_info(id: id, title: title2, address: address2, emoji_ind: emoji_ind2, em: em2, notes: notes2, likes: likes2, creatorID: creatorID2)
    }*/
}
