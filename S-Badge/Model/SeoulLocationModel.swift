import Foundation
import CoreLocation
public let CityHall = CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780) // 서울 시청
struct SeoulLocationModel {
    
    static var seoulLocations: [CLLocationCoordinate2D] {
        let numberOfLocations = 100
        let minLatitude = 37.42
        let maxLatitude = 37.68
        let minLongitude = 126.8
        let maxLongitude = 127.2
        
        
        let randomLocations = (0..<numberOfLocations).map { _ in
            CLLocationCoordinate2D(
                latitude: CLLocationDegrees.random(in: minLatitude...maxLatitude),
                longitude: CLLocationDegrees.random(in: minLongitude...maxLongitude)
            )
        }
        
        return randomLocations
    }
}
