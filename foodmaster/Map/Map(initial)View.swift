import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var locationManager = LocationManager()
    @State var search = ""
    @State var landmarks: [Landmark] = [Landmark]()
    
    private func getplaces(){
        let request=MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        let search=MKLocalSearch(request: request)
        search.start{(response, error) in
            if let response = response {
                let mapItems=response.mapItems
                self.landmarks=mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
            }
            
        }
    }
    
    var body: some View {
        ZStack{
            Image("bg_color")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                ZStack(alignment: .top){
                    MapObject(landmarks: landmarks)
                    TextField("Search", text: $search, onEditingChanged:{
                        _ in})
                    {
                        self.getplaces()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .offset(y: 44)
                }
                
                TabBarView(sc: 2)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
