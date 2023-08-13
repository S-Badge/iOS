import Foundation
import CoreLocation

struct SeoulLocationModel {
    static var seoulLocations: [CLLocationCoordinate2D] {
        let numberOfLocations = 50
        let minLatitude = 37.46
        let maxLatitude = 37.63
        let minLongitude = 126.9
        let maxLongitude = 127.1
        
        let randomLocations = (0..<numberOfLocations).map { _ in
            CLLocationCoordinate2D(
                latitude: CLLocationDegrees.random(in: minLatitude...maxLatitude),
                longitude: CLLocationDegrees.random(in: minLongitude...maxLongitude)
            )
        }
        
        return randomLocations
    }
}
