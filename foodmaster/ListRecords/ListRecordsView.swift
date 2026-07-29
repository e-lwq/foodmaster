import SwiftUI

struct ListRecordsView: View {
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
                    
                    NavigationLink(destination: TogolistView()){
                        VStack(alignment: .center){
                            Text("To-Go List")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(-20)
                            Image("checkbox")
                                .resizable()
                                .frame(width: 230, height: 230)
                                .padding(.bottom, 20)
                        }
                    }
                    
                    
                    NavigationLink(destination: FoodProfilesView()){
                        VStack(alignment: .center){
                            Text("Records")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.bottom, -20)
                            Image("book")
                                .resizable()
                                .frame(width: 250, height: 250)
                        }
                    }
                    Spacer()
                    
                    TabBarView(sc: 1)
                        .padding(.top, 20)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ListRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        ListRecordsView()
    }
}


/*
 problems:
 1. back buttons
 have to hide all of them and make them manually later
 2. preview keeps crashing???
 */
