import SwiftUI
import NMapsMap

struct MapMarkerScene: UIViewRepresentable {
    @ObservedObject var locationManager = LocationManager()
    @Binding var selectedLocation: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let naverMapView = NMFNaverMapView()
        naverMapView.showZoomControls = true
        naverMapView.mapView.zoomLevel = 10
        naverMapView.showLocationButton = true
        
        // Assign the coordinator instance as the touch delegate
        naverMapView.mapView.touchDelegate = context.coordinator
        
        DispatchQueue.main.async {
            
            // Add blue markers for Seoul locations
            for location in SeoulLocationModel.seoulLocations {
                let blueMarker = NMGLatLng(lat: location.latitude, lng: location.longitude)
                
                let marker = NMFMarker()
                marker.iconImage = NMF_MARKER_IMAGE_BLUE // Use blue marker icon
                marker.position = blueMarker
                marker.touchHandler = { (overlay) -> Bool in
                      print("마커 터치")
                    selectedLocation = CLLocationCoordinate2D(latitude: marker.position.lat, longitude: marker.position.lng)
                    print(selectedLocation)


                      return true
                    }
                marker.mapView = naverMapView.mapView
            }
            if let userLocation = locationManager.userLocation {
                let nmg = NMGLatLng(lat: userLocation.lat, lng: userLocation.lng)
                let centerLocation = NMGLatLng(lat: CityHall.latitude, lng: CityHall.longitude)
                let cameraUpdate = NMFCameraUpdate(scrollTo: centerLocation)
                
                
                let userMarker = NMFMarker()
                userMarker.iconImage = NMF_MARKER_IMAGE_RED // Use red marker icon
                userMarker.position = nmg
                userMarker.width = 25
                userMarker.height = 40
                userMarker.mapView = naverMapView.mapView
                naverMapView.mapView.moveCamera(cameraUpdate)
            }
            
        }
        
        return naverMapView
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        // Do nothing
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, NMFMapViewTouchDelegate {
        var parent: MapMarkerScene
        
        init(_ parent: MapMarkerScene) {
            self.parent = parent
        }
        private func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng) {
            
            parent.selectedLocation = CLLocationCoordinate2D(
                latitude: latlng.lat,
                longitude: latlng.lng
            )
            print(parent.selectedLocation)
//            let blueMarker = NMGLatLng(lat: latlng.lat, lng: latlng.lng)
//            
//            let marker = NMFMarker()
//            marker.iconImage = NMF_MARKER_IMAGE_BLUE // Use blue marker icon
//            marker.width = 60
//            marker.height = 60
//            marker.position = blueMarker
        }
        
    }
}
