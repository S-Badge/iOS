import SwiftUI
import NMapsMap
//        mapView.positionMode = .direction
//https://codekodo.tistory.com/210
struct MapChoiceView: UIViewRepresentable {
    @State private var centerCoordinate = NMGLatLng(lat: 37.5665, lng: 126.9780) // 기본 위치 (서울 시청)

    func makeUIView(context: Context) -> NMFNaverMapView {
        let mapView = NMFNaverMapView(frame: .zero)
        mapView.showLocationButton = true

        return mapView
    }

    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        let cameraUpdate = NMFCameraUpdate(scrollTo: centerCoordinate)
        uiView.mapView.moveCamera(cameraUpdate)

        // Add marker to the centerCoordinate
        let marker = NMFMarker()
        marker.position = centerCoordinate
        marker.mapView = uiView.mapView
    }
}
