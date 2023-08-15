import SwiftUI
import CoreLocation

struct NaverView: View {
    
    
    var body: some View {
        ZStack() {
            FirstMapView()
            
            FloatingAddressBar(coordinate: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780))
                
            
            CommentButton()
        }
    }
}
