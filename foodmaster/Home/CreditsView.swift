import SwiftUI

struct CreditsView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12){
                    BackButton()
                    
                    Text("Credits")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.top, 20)
                    
                    
                    Text("\n\nApp music")
                        .underline()
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("Chillpeach - Smell of Lavender")
                        .font(.title3)
                        .foregroundColor(.black)
                    
                    Link(destination: URL(string: "https://youtu.be/J5xpjUk6kfA")!, label:{
                        Text("youtu.be/J5xpjUk6kfA")
                            .foregroundColor(.blue)
                            .font(.title3)
                            .underline()
                            .padding(.bottom, 50)
                    })
                    
                    Text("Other Information")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(15)
                    
                    Text("Custom Google Search API was used")
                        .font(.title3)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
