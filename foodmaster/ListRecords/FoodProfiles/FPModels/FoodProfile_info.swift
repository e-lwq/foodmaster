import Foundation
import SwiftUI

struct FoodProfile_info: Identifiable{
    let id: String
    var foodname: String
    var origin: String
    var places: String
    var notes: String
    var img: Image?
    var likes: Int
    var creatorID: String
    
    
    /*init(id: String /*= UUID().uuidString*/, foodname: String, origin: String, places: String, notes: String, img: Image?){
        self.id = id
        self.foodname = foodname
        self.origin = origin
        self.places = places
        self.notes = notes
        self.img = img
    }*/
    
    /*func updateComplete(foodname2: String, origin2: String, places2: String, notes2: String, img2: Image?) -> FoodProfile_info{
        return FoodProfile_info(id: id, foodname: foodname2, origin: origin2, places: places2, notes: notes2, img: img2)
    }*/
}
