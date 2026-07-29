import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate{
    var control: MapObject
    
    init(_ control: MapObject){
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]){
        if let annotationView = views.first{
            if let annotation = annotationView.annotation{
                if annotation is MKUserLocation{
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true) //
                }
            }
        }
    }
}

struct MapObject: UIViewRepresentable {
    
    let landmarks: [Landmark]
    
    func makeUIView(context: Context) -> MKMapView{
        let map=MKMapView()
        map.showsUserLocation=true
        map.delegate=context.coordinator
        return map
    }
    
    func makeCoordinator()->Coordinator{
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapObject>){
        updateAnnotations(from: uiView)
    }
    
    func updateAnnotations(from mapView: MKMapView){
        mapView.removeAnnotations(mapView.annotations)
        let annotations=self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotation(annotations as! MKAnnotation)
    }
}
/*
struct MapObject_Previews: PreviewProvider {
    static var previews: some View {
        MapObject()
    }
}
*/
