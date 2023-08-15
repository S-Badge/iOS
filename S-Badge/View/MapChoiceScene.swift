import SwiftUI
import NMapsMap

struct MapChoiceScene: UIViewRepresentable {
    let naverMapView = NMFNaverMapView()
    @State var isChanging: Bool = false // 지도의 움직임 여부를 저장하는 프로퍼티
    func makeUIView(context: Context) -> NMFNaverMapView {
        
        naverMapView.showZoomControls = true
        naverMapView.mapView.zoomLevel = 10
        naverMapView.showLocationButton = true
        
        // Assign the coordinator instance as the touch delegate
        naverMapView.mapView.touchDelegate = context.coordinator
        let centerLocation = NMGLatLng(lat: CityHall.latitude, lng: CityHall.longitude)
        let cameraUpdate = NMFCameraUpdate(scrollTo: centerLocation)
        naverMapView.mapView.moveCamera(cameraUpdate)
        
            
        
        
        return naverMapView
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        
        // Do nothing
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, NMFMapViewTouchDelegate, NMFMapViewCameraDelegate {
        var parent: MapChoiceScene
        
        init(_ parent: MapChoiceScene) {
            self.parent = parent
        }
        
        internal func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
            print(point)
        }
        
        func mapViewCameraIdle(_ mapView: NMFMapView) {
            let centerLocation = mapView.cameraPosition.target
            print("Center Latitude: \(centerLocation.lat), Longitude: \(centerLocation.lng)")
        }
    }

    func mapViewDidChangeVisibleResion(_ mapView:NMFMapView){
        DispatchQueue.main.async {
            self.isChanging = true
            print(self.isChanging)
        }
    }
    

}
