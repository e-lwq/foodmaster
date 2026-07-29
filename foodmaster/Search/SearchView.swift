import SwiftUI

struct SearchView: View {
    @State var fetch = GoogleManager()
    @State var searchWord = ""
    @State var flag=false
    
    let options = ["Nutrition", "History", "Usage"]
    @State var chosen=0
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView()){
                            Image(systemName: "house")
                                .padding(20)
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                        }
                    }
                    
                    NavigationLink(destination: CountrySearchView()){
                        Image("FoodSearch")
                            .resizable()
                            .frame(width: 300, height: 50)
                            .padding(.vertical, 5)
                    }
                    
                    
                    VStack{
                        TextField("Enter the food you want to search", text: $searchWord)
                            .frame(width: 350, height: 50)
                            .background(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                            .padding(.bottom, 4)
                            .cornerRadius(8)
                        
                        HStack{
                            ZStack{
                                if chosen==0{
                                    Rectangle()
                                        .frame(width: 110, height: 40)
                                        .foregroundColor(.pink.opacity(0.2))
                                        .cornerRadius(15)
                                }
                                
                                Text(options[0])
                                    .foregroundColor(.blue)
                                    .font(.title2)
                            }.onTapGesture{chosen=0}
                            
                            ZStack{
                                if chosen==1{
                                    Rectangle()
                                        .frame(width: 110, height: 40)
                                        .foregroundColor(.pink.opacity(0.2))
                                        .cornerRadius(15)
                                }
                                
                                Text(options[1])
                                    .foregroundColor(.blue)
                                    .font(.title2)
                            }.onTapGesture{chosen=1}
                            
                            ZStack{
                                if chosen==2{
                                    Rectangle()
                                        .frame(width: 110, height: 40)
                                        .foregroundColor(.pink.opacity(0.2))
                                        .cornerRadius(15)
                                }
                                
                                Text(options[2])
                                    .foregroundColor(.blue)
                                    .font(.title2)
                            }.onTapGesture{chosen=2}
                        }
                        
                        Button{
                            searchButton(word: searchWord)
                        }label:{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.blue)
                                    .frame(width: 90, height: 40)
                                    .cornerRadius(8)
                                Text("Search")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                        }
                        
                        if flag{
                            VStack{
                                Text("Please enter 1 word only")
                                    .foregroundColor(.red)
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                Text("Make sure there are no spaces")
                                    .foregroundColor(.red)
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                    }
                    
                    ScrollView(.vertical){
                        VStack(){
                            ForEach(0..<9){index in
                                SearchItemsView(index: index)
                                    .padding(3)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    TabBarView(sc: 3)
                }
            }
        }.navigationBarHidden(true)
    }
    
    func checkWord(word: String)->Bool{
        return word.contains(" ")
    }
    
    func searchButton(word: String){
        if checkWord(word: word){
            flag=true
        }else if word != ""{
            flag=false
            fetch.fetchGoogle(searchWord: searchWord+options[chosen])
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
