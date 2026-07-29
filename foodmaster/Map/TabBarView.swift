import SwiftUI

struct TabBarView: View {
    
    let sc: Int
    
    var body: some View {
        HStack(spacing: 50){
            NavigationLink(destination: ListRecordsView()){
                Image(systemName: "list.bullet.rectangle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.black.opacity(sc==1 ? 1 : 0.4))
                    .padding(.top)
            }
            
            /*NavigationLink(destination: MapView()){
                Image(systemName: "mappin")
                    .font(.system(size: 30))
                    .foregroundColor(.black.opacity(sc==2 ? 1 : 0.4))
                    .padding(.top)
            }*/
            
            NavigationLink(destination: SearchView()){
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 30))
                    .foregroundColor(.black.opacity(sc==3 ? 1 : 0.4))
                    .padding(.top)
            }
            
            NavigationLink(destination: TriviaStartView()){
                Image(systemName: "questionmark.square.dashed")
                    .font(.system(size: 30))
                    .foregroundColor(.black.opacity(sc==4 ? 1 : 0.4))
                    .padding(.top)
            }

            NavigationLink(destination: AwardsView()){
                Image(systemName: "crown.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.black.opacity(sc==5 ? 1 : 0.4))
                    .padding(.top)
            }
        }
        .frame(width: 400, height: 45)
        .padding(.vertical, 10)
        .background(.white)
        .modifier(shadow_modifier())
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(sc:1)
    }
}
