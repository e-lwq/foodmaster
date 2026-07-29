import SwiftUI

struct RankingsView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        BackButton()
                        
                        Text("Rankings Table")
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        HStack(spacing: 20){
                            VStack(spacing: 85){
                                Text("Beginner")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                Text("Great")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                Text("Expert")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                Text("Veteran")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                Text("Ultra")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                Text("Master")
                                    .fontWeight(.bold)
                                    .font(.title3)
                            }
                            VStack(spacing: 85){
                                Text("Start")
                                    .italic()
                                    .font(.title3)
                                Text("100xp")
                                    .italic()
                                    .font(.title3)
                                Text("300xp")
                                    .italic()
                                    .font(.title3)
                                Text("600xp")
                                    .italic()
                                    .font(.title3)
                                Text("1000xp")
                                    .italic()
                                    .font(.title3)
                                Text("1500xp")
                                    .italic()
                                    .font(.title3)
                            }
                            VStack(spacing: 10){
                                Image("Beginner")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Image("Great")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Image("Expert")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Image("Veteran")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Image("Ultra")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Image("Master")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}


struct RankingsView_Previews: PreviewProvider {
    static var previews: some View {
        RankingsView()
    }
}
