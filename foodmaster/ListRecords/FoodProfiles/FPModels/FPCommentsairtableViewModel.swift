import Foundation

import Foundation
import SwiftUI

class FPCommentsairtableViewModel: ObservableObject{
    
    @Published var results: [FPCommentRecord] = []
    @Published var flag = false
    
    init(){
        results = []
        flag=false
    }
    
    func fetch(FPID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.fpcomments_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(FPCommentrecords.self, from: data)
                DispatchQueue.main.async{
                    self.results = []
                    for record in rr.records{
                        if record.fields.FPID == FPID{
                            self.results.append(record)
                        }
                    }
                    self.results = self.results.sorted(by: {$0.createdTime > $1.createdTime})
                }
            }catch{ return }
        }
        
        task.resume()
        
    }
    
    func create_record(creatorID: String, comment: String, FPID: String, username: String, rank: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.fpcomments_id)?api_key=\(ATConstants.apikey)") else{
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let fields: [String: AnyHashable] = [
            "creatorID": creatorID,
            "comment": comment,
            "FPID": FPID,
            "username": username,
            "rank": rank
        ]
        
        let body: [String: AnyHashable] = [
            "fields": fields,
            "typecast": true
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error==nil else{
                return
            }
            do{
                //let response
                _ = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //print("Response: \(response)")
            }
            catch{ return }
        }
        
        task.resume()
    }
    
    /*func SUBupdateRecord(creatorID: String, comment: String, FPID: String, username: String, rank: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.fpcomments_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let ind = Int(self.FPIDs.firstIndex(of: FPID) ?? 0)
        let id = self.allresults[ind].id
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let fields: [String: AnyHashable] = [
            "FPID": FPID,
            "foodname": foodname,
            "origin": origin,
            "places": places,
            "notes": notes,
            "likes": likes,
            "creatorID": creatorID
        ]
        let record: [String: AnyHashable] = [
            "id": id,
            "fields": fields
        ]
        
        let body: [String: AnyHashable] = [
            "records": [record],
            "typecast": true
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error==nil else{
                return
            }
            do{
                _ = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            }
            catch{return}
        }
        
        task.resume()
    }
    
    func updateRecord(FPID: String, foodname: String, origin: String, places: String, notes: String, likes: Int, creatorID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.foodprofiles_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(FPrecords.self, from: data)
                DispatchQueue.main.async{
                    
                    self.FPIDs = []
                    self.allresults = rr.records
                    
                    for result in self.allresults{
                        self.FPIDs.append(result.fields.FPID)
                    }
                    
                    if(self.FPIDs.contains(FPID)){
                        self.SUBupdateRecord(FPID: FPID, foodname: foodname, origin: origin, places: places, notes: notes, likes: likes, creatorID: creatorID)
                    }else{
                        self.create_record(FPID: FPID, foodname: foodname, origin: origin, places: places, notes: notes, likes: likes, creatorID: creatorID)
                    }
                }
            }catch{ return }
        }
        
        task.resume()
        
    }*/
    
    
}

