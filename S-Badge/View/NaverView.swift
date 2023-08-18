import SwiftUI
import CoreLocation

struct NaverView: View {
    @State var selectedLocation = CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780)
    @StateObject private var CTAviewModel = CoordinateToAddressViewModel()
    @State private var receivedAddress: String?
    
    var body: some View {
        ZStack() {
            
            MapMarkerScene(selectedLocation: $selectedLocation)
            VStack {
                Rectangle()
                    .fill(Color.white) // 옅은 회색 배경
                    .overlay(
                        Text(String(describing: receivedAddress ?? "마커를 클릭해주세요👇"))
                            .font(.headline)
                            .padding()
                    )
                    .frame(width: 300, height: 40)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange.opacity(0.5), lineWidth: 5) // 주황색 테두리 라인 (투명도 적용)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 3, y: 3) // 그림자 추가
                                           
                    )
                
                Spacer()
            }
            
            CommentButton()
        }
        .onChange(of: selectedLocation) { _ in
            fetchAddress(coordinate: selectedLocation)
                }
    }
    
    private func fetchAddress(coordinate:CLLocationCoordinate2D) {
        CTAviewModel.fetchAddress(forCoordinate: selectedLocation) { result in
            switch result {
            case .success(let addressModel):
                DispatchQueue.main.async {
                    receivedAddress = addressModel.documents?.first?.address?.addressName
                }
            case .failure(let error):
                print("Error fetching address:", error)
            }
        }
    }
}
extension CLLocationCoordinate2D: Equatable {
    public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
