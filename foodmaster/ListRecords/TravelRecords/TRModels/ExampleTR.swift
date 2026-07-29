import Foundation
import SwiftUI

class ExampleTR: ObservableObject{
    
    @Published var TRitems: [TR_info] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems:[TR_info] = [
            TR_info(id: "0", title: "Pizza Hut", address: "Shop 107, Level 1, Shui Chuen O Shopping Centre, Shui Chuen O Estate, Sha Tin, New Territories, Sha Tin", emoji_ind: 1, em: 4, notes: "Its pizza is delicious, especially the Hawaiian pizza with pineapple on it. ", likes: 0, creatorID: "000000"),
            TR_info(id: "1", title: "Genki sushi", address: "Shop B2, B/F Hanford Commercial Centre 221B-E, Nathan Rd, Jordan", emoji_ind: 3, em: 3, notes: "Dishes are delivered to the customers by a conveyor belt.", likes: 0, creatorID: "000000"),
            TR_info(id: "2", title: "Lobby Lounge", address: "Salisbury Rd, Tsim Sha Tsui (in the Peninsula)", emoji_ind: 2, em: 5, notes: "Must try its afternoon tea (but the pricing is a quite high)", likes: 0, creatorID: "000000")
         ]
        TRitems.append(contentsOf: newItems)
    }
}
