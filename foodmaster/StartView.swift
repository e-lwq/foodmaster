import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("Welcome to foodmaster!")
                        .font(.title)
                        .foregroundColor(.init(red: 0.38, green: 0.5, blue: 0.68))
                        .fontWeight(.bold)
                    
                    Image("appicon")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    Text("Allow me to take you through this app...")
                        .font(.title2)
                        .foregroundColor(.init(red: 0.38, green: 0.5, blue: 0.68))
                        .fontWeight(.bold)
                    
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
