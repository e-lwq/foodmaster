import SwiftUI

struct FPBackButton: View {
    let ind: Int
    
    var body: some View {
        if(ind==0){
            NavigationLink(destination: FoodProfilesView()){
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    Text("All Food Profiles")
                        .font(.title3)
                        .foregroundColor(.blue)
                    Spacer()
                }.padding(.leading, 5)
            }
        }else if(ind==1){
            NavigationLink(destination: MostLikedFoodProfilesView()){
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    Text("Most Liked Food Profiles")
                        .font(.title3)
                        .foregroundColor(.blue)
                    Spacer()
                }.padding(.leading, 5)
            }
        }else if ind==2{
            NavigationLink(destination: FPSearchView()){
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    Text("Food Profiles Search")
                        .font(.title3)
                        .foregroundColor(.blue)
                    Spacer()
                }.padding(.leading, 5)
            }
        }
    }
}

struct FPBackButton_Previews: PreviewProvider {
    static var previews: some View {
        FPBackButton(ind: 0)
    }
}
