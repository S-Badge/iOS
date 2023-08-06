import Foundation
import SwiftUI
import NMapsMap


struct FirstMapView: UIViewRepresentable {
    @ObservedObject var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let mapView = NMFNaverMapView()
        mapView.showLocationButton = true
        mapView.positionMode = .direction
        
        DispatchQueue.main.async {
            if let userLocation = locationManager.userLocation {
                let nmg = NMGLatLng(lat: userLocation.lat, lng: userLocation.lng)
                let cameraUpdate = NMFCameraUpdate(scrollTo: nmg)
        
                let marketMarker = NMFMarker()
                marketMarker.iconImage = NMF_MARKER_IMAGE_BLACK
                marketMarker.iconTintColor = UIColor.red
                marketMarker.position = nmg
                marketMarker.width = 25
                marketMarker.height = 40
                marketMarker.mapView = mapView.mapView
                marketMarker.mapView?.moveCamera(cameraUpdate)
            }
        }
        return mapView
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        // Do nothing
    }
}

