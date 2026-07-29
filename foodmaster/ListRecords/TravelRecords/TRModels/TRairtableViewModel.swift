import Foundation
import SwiftUI

class TRairtableViewModel: ObservableObject{
    
    @Published var results: [TRRecord] = []
    @Published var results2: [TRRecord] = []
    @Published var allresults: [TRRecord] = []
    @Published var TRIDs: [String] = []
    @Published var flag = false
    
    @Published var MyTravelRecords: [TR_info] = []
    @Published var tmp_results: [TR_info] = []
    
    init(){
        results = []
        results2 = []
        allresults = []
        MyTravelRecords = []
        TRIDs = []
        flag = false
    }
    
    func fetch(){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.travelrecords_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(TRrecords.self, from: data)
                DispatchQueue.main.async{
                    
                    self.TRIDs = []
                    
                    self.allresults = Array(rr.records.sorted(by: {$0.fields.likes > $1.fields.likes}))
                    self.results = Array(self.allresults.prefix(200))
                    self.results2 = Array(self.allresults.prefix(10))
                    
                    for result in self.allresults{
                        self.TRIDs.append(result.fields.TRID)
                    }
                }
            }catch{ return }
        }
        
        task.resume()
        
    }
    
    func fetchSpecificTravelRecords(creatorID: String){
        
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.travelrecords_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(TRrecords.self, from: data)
                DispatchQueue.main.async{
                    
                    self.MyTravelRecords = []
                    
                    let tmp = rr.records
                    
                    for result in tmp{
                        if(result.fields.creatorID == creatorID){
                            self.MyTravelRecords.append(TR_info(id: result.fields.TRID, title: result.fields.title, address: result.fields.address, emoji_ind: result.fields.emoji_ind, em: result.fields.em, notes: result.fields.notes, likes: result.fields.likes, creatorID: result.fields.creatorID))
                        }
                    }
                }
            }catch{ return }
        }
        
        task.resume()
    }
    
    func fetchByName(title: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.travelrecords_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(TRrecords.self, from: data)
                DispatchQueue.main.async{
                    
                    self.tmp_results = []
                    
                    let tmp = rr.records
                    
                    for result in tmp{
                        if(result.fields.title.lowercased().contains(title.lowercased())){
                            self.tmp_results.append(TR_info(id: result.fields.TRID, title: result.fields.title, address: result.fields.address, emoji_ind: result.fields.emoji_ind, em: result.fields.em, notes: result.fields.notes, likes: result.fields.likes, creatorID: result.fields.creatorID))
                        }
                    }
                }
            }catch{ return }
        }
        
        task.resume()
    }
    
    func create_record(TRID: String, title: String, address: String, emoji_ind: Int, em: Int, notes: String, likes: Int, creatorID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.travelrecords_id)?api_key=\(ATConstants.apikey)") else{
            print(1)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let fields: [String: AnyHashable] = [
            "TRID": TRID,
            "title": title,
            "address": address,
            "emoji_ind": emoji_ind,
            "em": em,
            "notes": notes,
            "likes": likes,
            "creatorID": creatorID
        ]
        
        let body: [String: AnyHashable] = [
            "fields": fields,
            "typecast": true
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error==nil else{ print(2)
                return
            }
            do{
                //let response
                _ = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //print("Response: \(response)")
            }
            catch{print(3); return }
        }
        
        task.resume()
    }
    
    func SUBupdateRecord(TRID: String, title: String, address: String, emoji_ind: Int, em: Int, notes: String, likes: Int, creatorID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.travelrecords_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let ind = Int(self.TRIDs.firstIndex(of: TRID) ?? 0)
        let id = self.allresults[ind].id
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let fields: [String: AnyHashable] = [
            "TRID": TRID,
            "title": title,
            "address": address,
            "emoji_ind": emoji_ind,
            "em": em,
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
    
    func updateRecord(TRID: String, title: String, address: String, emoji_ind: Int, em: Int, notes: String, likes: Int, creatorID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.travelrecords_id)?api_key=\(ATConstants.apikey)")
        else{ return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(TRrecords.self, from: data)
                DispatchQueue.main.async{
                    
                    self.TRIDs = []
                    self.allresults = rr.records
                    
                    for result in self.allresults{
                        self.TRIDs.append(result.fields.TRID)
                    }
                    
                    if(self.TRIDs.contains(TRID)){
                        self.SUBupdateRecord(TRID: TRID, title: title, address: address, emoji_ind: emoji_ind, em: em, notes: notes, likes: likes, creatorID: creatorID)
                    }else{
                        self.create_record(TRID: TRID, title: title, address: address, emoji_ind: emoji_ind, em: em, notes: notes, likes: likes, creatorID: creatorID)
                    }
                }
            }catch{ return }
        }
        
        task.resume()
        
    }
    
    func SUBdeleteRecord(id: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.travelrecords_id)/\(id)?api_key=\(ATConstants.apikey)")
        else{
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let records: [String: AnyHashable] = ["id": id]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: records, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error==nil else{
                return
            }
            do{
                _ = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            }
            catch{ return }
        }
        
        task.resume()
    }
    
    func deleteRecord(TRID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.travelrecords_id)?api_key=\(ATConstants.apikey)") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(TRrecords.self, from: data)
                
                DispatchQueue.main.async{
                    
                    self.TRIDs = []
                    
                    self.allresults = Array(rr.records.sorted(by: {$0.fields.likes > $1.fields.likes}))
                    
                    for result in self.allresults{
                        self.TRIDs.append(result.fields.TRID)
                    }
                    
                    if(self.TRIDs.contains(TRID)){
                        let ind = self.TRIDs.firstIndex(of: TRID) ?? -1
                        
                        if(ind != -1){
                            let id = self.allresults[ind].id
                            self.SUBdeleteRecord(id: id)
                        }
                        
                    }
                    
                }
            }catch{ return }
        }
        
        task.resume()
        
    }
}
