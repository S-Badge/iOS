import SwiftUI
import CoreLocation
import Alamofire

class CoordinateToAddressViewModel: ObservableObject {
    func fetchAddress(forCoordinate coordinate: CLLocationCoordinate2D, completion: @escaping (Result<KakaoAddressModel, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded;charset=utf-8",
            "Authorization": "KakaoAK 87b21a4eb97dc115a7538213dffb974b",
        ]
        
        let url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?input_coord=WGS84&x=\(coordinate.longitude)&y=\(coordinate.latitude)"
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: KakaoAddressModel.self) { response in
                switch response.result {
                    case .success(let addressModel):
                        completion(.success(addressModel))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
    }
    
}
