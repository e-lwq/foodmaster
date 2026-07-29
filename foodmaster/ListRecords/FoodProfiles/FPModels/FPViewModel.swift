import Foundation
import SwiftUI

class FPViewModel: ObservableObject{
    
    //@ObservableObject var Info: Information
    //@Published var FPitems: [FoodProfile_info] = []
    @Published var LikedFPs: [String] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        //let newItems:[FoodProfile_info] = []
            /*FoodProfile_info(foodname: "Sandwich", origin: "b", places: "c", notes: "d", img: Image("sandwich")),
            FoodProfile_info(foodname: "Hot Pot", origin: "b", places: "c", notes: "d", img: Image("hotpot")),
            FoodProfile_info(foodname: "Pizza", origin: "b", places: "c", notes: "d", img: Image("pizza"))
        ]*/
        let newItems2: [String] = []
        
        //FPitems.append(contentsOf: newItems)
        LikedFPs.append(contentsOf: newItems2)
    }
    
    /*func deleteItem(item: FoodProfile_info){
        if let index = FPitems.firstIndex(where: {$0.id==item.id}){
            FPitems.remove(at:index)
        }
    }
    
    func moveItem(from: IndexSet, to: Int){
        FPitems.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(id: String, foodname: String, origin: String, places: String, notes: String, img: Image?, likes: Int, creatorID: String){
        let newItem=FoodProfile_info(id: id, foodname: foodname, origin: origin, places: places, notes: notes, img: img, likes: likes, creatorID: creatorID)
        FPitems.append(newItem)
    }
    
    func updateItem(item: FoodProfile_info, foodname: String, origin: String, places: String, notes: String, img: Image?){
        if let index = FPitems.firstIndex(where: {$0.id == item.id}){
            FPitems[index].foodname = foodname
            FPitems[index].origin = origin
            FPitems[index].places = places
            FPitems[index].notes = notes
            FPitems[index].img = img ?? nil
            
            //FPitems[index] = item.updateComplete(foodname2: foodname, origin2: origin, places2: places, notes2: notes, img2: img)
        }
    }*/
    
    func likeItem(FPID: String){
        LikedFPs.append(FPID)
    }
    
    func unlikeItem(FPID: String){
        if let index = LikedFPs.firstIndex(of: FPID){
            LikedFPs.remove(at:index)
        }
    }
}
