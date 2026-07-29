import SwiftUI

struct TRBackButton: View {
    let ind: Int
    
    var body: some View {
        if(ind==0){
            NavigationLink(destination: TravelRecordsView()){
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    Text("All Travel Records")
                        .font(.title3)
                        .foregroundColor(.blue)
                    Spacer()
                }.padding(.leading, 5)
            }
        }else if(ind==1){
            NavigationLink(destination: MostLikedTravelRecordsView()){
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    Text("Most Liked Travel Records")
                        .font(.title3)
                        .foregroundColor(.blue)
                    Spacer()
                }.padding(.leading, 5)
            }
        }else if ind==2{
            NavigationLink(destination: TRSearchView()){
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    Text("Travel Records Search")
                        .font(.title3)
                        .foregroundColor(.blue)
                    Spacer()
                }.padding(.leading, 5)
            }
        }else{
            NavigationLink(destination: ExampleTRView()){
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    Text("Example Travel Records")
                        .font(.title3)
                        .foregroundColor(.blue)
                    Spacer()
                }.padding(.leading, 5)
            }
        }
    }
}

struct TRBackButton_Previews: PreviewProvider {
    static var previews: some View {
        TRBackButton(ind: 0)
    }
}
