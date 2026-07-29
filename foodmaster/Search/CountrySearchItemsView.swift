import SwiftUI

/*extension String{
    func load() -> UIImage{
        do{
            guard let url = URL(string: self) else {return UIImage()}
            let data: Data = try
            Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        }catch{
            
        }
        return UIImage()
    }
}
*/
struct CountrySearchItemsView: View {
    //@StateObject var SearchlistViewModel = SearchViewModel()
    @ObservedObject var googleManager = GoogleManager.shared()
    @State var index: Int
    
    var body: some View {
        ScrollView(.vertical){
                    
            VStack(){
                        
                ForEach(googleManager.items.allItems, id: \.id){item in
                            
                    VStack{
                        /*Text(item.title[index]!)
                            //.frame(width: 300, height: 160)
                            .frame(width:300)
                            .font(.headline)
                            .padding(7)*/
                        
                        /*ForEach(googleManager.images.allImages, id: \.id){image in
                            Image(uiImage: (image.image[index]?.load() ?? UIImage(systemName: "camera"))!)
                                .resizable()
                                .frame(width: 200, height: 200)
                        }*/
                        
                        /*Text(item.description[index]!)
                            .frame(width: 200, height: 160)
                            .font(.system(size: 18))*/
                        
                        Link(destination: URL(string: item.link[index]!)!, label:{
                            Text(item.title[index]!)
                                .frame(width:320)
                                .font(.headline)
                                .padding(7)
                                .foregroundColor(.black)
                                //.underline()
                        })
                        
                        Link(destination: URL(string: item.link[index]!)!, label:{
                            Text(item.link[index]!)
                                .frame(width:300)
                                .font(.system(size: 15))
                                .foregroundColor(.blue)
                                .padding(7)
                        })
                    }
                    .background(Color.yellow.opacity(0.4))
                    .cornerRadius(15)
                    .padding(.vertical, 5)
                    .modifier(shadow_modifier())
                }
                        
            }.frame(maxHeight: .infinity)
                    
                    
        }
    }
}

struct CountrySearchItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CountrySearchItemsView(index: 0)
    }
}
