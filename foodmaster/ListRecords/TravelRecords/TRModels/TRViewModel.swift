import Foundation
import SwiftUI

class TRViewModel: ObservableObject{
    @Published var LikedTRs: [String] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems: [String] = []
        LikedTRs.append(contentsOf: newItems)
    }
    
    func likeItem(TRID: String){
        LikedTRs.append(TRID)
    }
    
    func unlikeItem(TRID: String){
        if let index = LikedTRs.firstIndex(of: TRID){
            LikedTRs.remove(at:index)
        }
    }
}
