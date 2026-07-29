import Foundation

class GoogleManager: ObservableObject{
    @Published var items = SearchItemInfo(allItems: [])
    //@Published var images = ImageData(allImages: [])
    
    private static var sharedNetworkManager: GoogleManager = {
        let googleManager = GoogleManager()
        return googleManager
    }()
    
    class func shared() -> GoogleManager{
        return sharedNetworkManager
    }
    
    func fetchGoogle(searchWord: String){
        let urlString = "https://www.googleapis.com/customsearch/v1?q=\(searchWord)&key=\(Constants.key)&cx=\(Constants.se)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data, response, error) in
                if error != nil{
                    //print(error!)
                    return
                }
                if let safeData = data{
                    self.parseJSON(googleData: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(googleData: Data){
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let responseItems = try decoder.decode(GoogleData.self, from: googleData)
            //let thumbnail = responseItems.items.map({$0.pagemap.metatags.map({$0.ogImage})})
            //let allImages = Array(thumbnail.joined())
            let title = responseItems.items.map({$0.title})
            let description = responseItems.items.map({$0.snippet})
            let link = responseItems.items.map({$0.link})
            
            DispatchQueue.main.async{
                //let googleImages = GoogleImage(image: allImages)
                
                //GoogleManager.shared().images.allImages.append(googleImages)
            }
            
            let googleResult = GoogleModel(title: title, description: description, link: link)
            
            DispatchQueue.main.async{
                GoogleManager.shared().items.allItems=[]
                GoogleManager.shared().items.allItems.append(googleResult)
            }
        }
        catch{
            //print(error)
        }
    }
}
