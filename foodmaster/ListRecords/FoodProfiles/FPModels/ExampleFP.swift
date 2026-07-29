import Foundation
import SwiftUI

class ExampleFP: ObservableObject{
    
    //@ObservableObject var Info: Information
    @Published var FPitems: [FoodProfile_info] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems:[FoodProfile_info] = [
            FoodProfile_info(id: "0", foodname: "Sandwich", origin: "England", places: "Oliver's Sandwich\nMorty's", notes: "The sandwich is named after John Montagu, 4th Earl of Sandwich, an eighteenth-century English aristocrat. It is commonly said that Lord Sandwich, during long sessions of cribbage and other card games at public gambling houses, would order his valet to bring him salt beef between two pieces of toasted bread.", img: Image("sandwich"), likes: 0, creatorID: ""),
        
            FoodProfile_info(id: "1", foodname: "Hot Pot", origin: "China", places: "The Drunken Pot\nMarket Hotpot", notes: "It has a history of more than 1000 years, and China is regarded as the home of hotpot. It is generally assumed that the hotpot tradition came from Mongol warriors and horsemen who camped outside and had dinner together circled around a pot on the fire – it was a way to keep warm, while eating at the same time.", img: Image("hotpot"), likes: 0, creatorID: ""),
        
            FoodProfile_info(id: "2", foodname: "Pizza", origin: "Italy", places: "Pizza Hut\nPizza Express\nLa Camionetta", notes: "Pizza has a long history. Flatbreads with toppings were consumed by the ancient Egyptians, Romans and Greeks. (The latter ate a version with herbs and oil, similar to today's focaccia.) But the modern birthplace of pizza is southwestern Italy's Campania region, home to the city of Naples.", img: Image("pizza"), likes: 0, creatorID: "")
         ]
        FPitems.append(contentsOf: newItems)
    }
}
