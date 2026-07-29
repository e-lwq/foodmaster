import Foundation
import SwiftUI

var userID_return = ""

class LViewModel: ObservableObject{
    
    @Published var results: [Record] = []
    @Published var allresults: [Record] = []
    @Published var userIDs: [String] = []
    @Published var trivia_results: [Record] = []
    
    @Published var flag = false
    
    init(){
        results = []
        allresults = []
        userIDs = []
        trivia_results = []
        flag=false
    }
    
    
    
    func fetch(){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.leaderboard_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(records.self, from: data)
                DispatchQueue.main.async{
                    
                    self.userIDs = []
                    
                    self.allresults = Array(rr.records.sorted(by: {$0.fields.xp > $1.fields.xp}))
                    self.results = Array(self.allresults.prefix(200)) //had a ? after self before
                    
                    for result in self.allresults{
                        self.userIDs.append(result.fields.userID)
                    }
                    
                    //print(self.userIDs)
                    
                }
            }catch{ return }
        }
        
        task.resume()
    }
    
    func fetch_trivia(){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.leaderboard_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(records.self, from: data)
                DispatchQueue.main.async{
                    
                    self.userIDs = []
                    
                    self.trivia_results = Array(rr.records.sorted(by: {$0.fields.trivia_xp > $1.fields.trivia_xp}).prefix(200))
                    
                    for result in self.trivia_results{
                        self.userIDs.append(result.fields.userID)
                    }
                    
                }
            }catch{ return }
        }
        
        task.resume()
        
    }
    
    func create_record(userID: String, name: String, xp: Int, rank: String, trivia_xp: Int){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.leaderboard_id)?api_key=\(ATConstants.apikey)") else{
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let fields: [String: AnyHashable] = [
            "userID": userID,
            "xp": xp,
            "rank": rank,
            "name": name,
            "trivia_xp": trivia_xp
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
    
    func SUBupdateRecord(userID: String, name: String, xp: Int, rank: String, trivia_xp: Int){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.leaderboard_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let ind = Int(self.userIDs.firstIndex(of: userID) ?? 0)
        let id = self.allresults[ind].id
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let fields: [String: AnyHashable] = [
            "userID": userID,
            "xp": xp,
            "rank": rank,
            "name": name,
            "trivia_xp": trivia_xp
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
    
    func updateRecord(userID: String, name: String, xp: Int, rank: String, trivia_xp: Int){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.leaderboard_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(records.self, from: data)
                DispatchQueue.main.async{
                    
                    self.userIDs = []
                    self.allresults = rr.records
                    
                    for result in self.allresults{
                        self.userIDs.append(result.fields.userID)
                    }
                    
                    if(self.userIDs.contains(userID)){
                        self.SUBupdateRecord(userID: userID, name: name, xp: xp, rank: rank, trivia_xp: trivia_xp)
                    }else{
                        self.create_record(userID: userID, name: name, xp: xp, rank: rank, trivia_xp: trivia_xp)
                    }
                }
            }catch{ return }
        }
        
        task.resume()
        
    }
    
    /*func generateUSERID() -> String{
        
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.leaderboard_id)?api_key=\(ATConstants.apikey)")
        else{ return ""}
        
        let task = URLSession.shared.dataTask(with: url) { data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(records.self, from: data)
                DispatchQueue.main.async{
                    
                    self.userIDs = []
                    self.allresults = rr.records.sorted(by: {$0.fields.xp > $1.fields.xp})
                    
                    for result in self.allresults{
                        self.userIDs.append(result.fields.userID)
                    }
                    
                    for userID in self.userIDs{
                        self.userIDs_int.append(Int(userID) ?? 0)
                    }
                    
                    var newUSERID_int = (self.userIDs_int.max() ?? 0)
                    newUSERID_int = newUSERID_int + 1
                    
                    var newUSERID_str = String(newUSERID_int)
                    let tmp = 6-newUSERID_str.count
                    
                    if(tmp>0){
                        for _ in 1...tmp{
                            newUSERID_str = "0" + newUSERID_str
                        }
                    }
                    
                    userID_return = newUSERID_str
                }
            }catch{ return }
        }
        
        task.resume()
        
        return userID_return
    }
     */
    
}
