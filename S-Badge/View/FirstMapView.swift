import SwiftUI
import NMapsMap

struct FirstMapView: UIViewRepresentable {
    @ObservedObject var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let NMapView = NMFNaverMapView()
        NMapView.showZoomControls = true
        NMapView.mapView.zoomLevel = 10
        NMapView.showLocationButton = true
        
        DispatchQueue.main.async {
            // Add red markers for user location
            
            
            // Add blue markers for Seoul locations
            for location in SeoulLocationModel.seoulLocations {
                let nmg = NMGLatLng(lat: location.latitude, lng: location.longitude)
                
                let marker = NMFMarker()
                marker.iconImage = NMF_MARKER_IMAGE_BLUE // Use blue marker icon
                marker.position = nmg
                marker.width = 25
                marker.height = 40
                marker.mapView = NMapView.mapView
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
                userMarker.mapView = NMapView.mapView
                NMapView.mapView.moveCamera(cameraUpdate)
            }
        }
        
        return NMapView
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        // Do nothing
    }
}
