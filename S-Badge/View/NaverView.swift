import SwiftUI
import CoreLocation

struct NaverView: View {
    @State var selectedLocation = CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780)
    
    var body: some View {
        ZStack() {
            FirstMapView(selectedLocation: $selectedLocation)
            
            FloatingAddressBar(coordinate: $selectedLocation)
                
            
            CommentButton()
        }
    }
}
