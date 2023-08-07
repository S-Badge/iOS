import SwiftUI
import MapKit

struct MapMarkerView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.532600, longitude: 127.024612), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @State private var trackingUserLocation = false
    @State private var annotations = [CustomMapAnnotation]() // CustomMapAnnotation 데이터 모델 배열
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(coordinateRegion: $region, showsUserLocation: trackingUserLocation, annotationItems: annotations) { annotation in
                MapMarker(coordinate: annotation.coordinate)
            }
            
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        trackingUserLocation.toggle()
                    }, label: {
                        Image(systemName: trackingUserLocation ? "location.fill" : "location")
                            .foregroundColor(trackingUserLocation ? .blue : .black)
                    })
                    .padding()
                    
                    Button(action: {
                        zoomIn()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    })
                    .padding()
                    
                    Button(action: {
                        zoomOut()
                    }, label: {
                        Image(systemName: "minus")
                            .foregroundColor(.blue)
                    })
                    .padding()
                }
            }
            .padding()
        }
    }
    
    private func zoomIn() {
        var newRegion = region
        newRegion.span.latitudeDelta /= 2
        newRegion.span.longitudeDelta /= 2
        region = newRegion
    }
    
    private func zoomOut() {
        var newRegion = region
        newRegion.span.latitudeDelta /= 0.5
        newRegion.span.longitudeDelta /= 0.5
        region = newRegion
    }
}

struct CustomMapAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
