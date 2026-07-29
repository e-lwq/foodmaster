import Foundation
import SwiftUI

class FPairtableViewModel: ObservableObject{
    
    @Published var results: [FPRecord] = []
    @Published var results2: [FPRecord] = []
    @Published var allresults: [FPRecord] = []
    @Published var FPIDs: [String] = []
    
    @Published var MyFoodProfiles: [FoodProfile_info] = []
    @Published var tmp_results: [FoodProfile_info] = []
    
    @Published var flag = false
    
    init(){
        results = []
        results2 = []
        allresults = []
        MyFoodProfiles = []
        FPIDs = []
        flag=false
    }
    
    func fetch(){
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
                    
                    self.allresults = Array(rr.records.sorted(by: {$0.fields.likes > $1.fields.likes}))
                    self.results = Array(self.allresults.prefix(200))
                    self.results2 = Array(self.allresults.prefix(10))
                    
                    for result in self.allresults{
                        self.FPIDs.append(result.fields.FPID)
                    }
                }
            }catch{ return }
        }
        
        task.resume()
        
    }
    
    func fetchSpecificFoodProfiles(creatorID: String){
        
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
                    
                    self.MyFoodProfiles = []
                    
                    let tmp = rr.records
                    
                    for result in tmp{
                        if(result.fields.creatorID == creatorID){
                            self.MyFoodProfiles.append(FoodProfile_info(id: result.fields.FPID, foodname: result.fields.foodname, origin: result.fields.origin, places: result.fields.places, notes: result.fields.notes, likes: result.fields.likes, creatorID: creatorID))
                        }
                    }
                }
            }catch{ return }
        }
        
        task.resume()
    }
    
    func fetchByName(name: String){
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
                    
                    self.tmp_results = []
                    
                    let tmp = rr.records
                    
                    for result in tmp{
                        if(result.fields.foodname.lowercased().contains(name.lowercased())){
                            self.tmp_results.append(FoodProfile_info(id: result.fields.FPID, foodname: result.fields.foodname, origin: result.fields.origin, places: result.fields.places, notes: result.fields.notes, likes: result.fields.likes, creatorID: result.fields.creatorID))
                        }
                    }
                }
            }catch{ return }
        }
        
        task.resume()
    }
    
    func create_record(FPID: String, foodname: String, origin: String, places: String, notes: String, likes: Int, creatorID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.foodprofiles_id)?api_key=\(ATConstants.apikey)") else{
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
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
    
    func SUBupdateRecord(FPID: String, foodname: String, origin: String, places: String, notes: String, likes: Int, creatorID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.foodprofiles_id)?api_key=\(ATConstants.apikey)")
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
        
    }
    
    func SUBdeleteRecord(id: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.foodprofiles_id)/\(id)?api_key=\(ATConstants.apikey)")
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
    
    func deleteRecord(FPID: String){
        guard let url = URL(string: "https://api.airtable.com/v0/\(ATConstants.baseID)/\(ATConstants.foodprofiles_id)?api_key=\(ATConstants.apikey)") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let rr = try JSONDecoder().decode(FPrecords.self, from: data)
                
                DispatchQueue.main.async{
                    
                    self.FPIDs = []
                    
                    self.allresults = Array(rr.records.sorted(by: {$0.fields.likes > $1.fields.likes}))
                    
                    for result in self.allresults{
                        self.FPIDs.append(result.fields.FPID)
                    }
                    
                    if(self.FPIDs.contains(FPID)){
                        let ind = self.FPIDs.firstIndex(of: FPID) ?? -1
                        
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
