import SwiftUI
import CoreLocation

struct TestView: View {
    @StateObject private var CTAviewModel = CoordinateToAddressViewModel()
    @State private var receivedAddress: String?
    let coordinate: CLLocationCoordinate2D
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray.opacity(0.1)) // 옅은 회색 배경
                .overlay(
                    Text(receivedAddress ?? "데이터를 받고있습니다아...")
                        .font(.headline)
                        .padding()
                )
                .frame(width: 300, height: 40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange.opacity(0.5), lineWidth: 5) // 주황색 테두리 라인 (투명도 적용)
                )
            
            Spacer()
        }
        .padding()
        .onAppear {
            fetchAddress()
        }
    }
    
    private func fetchAddress() {
        CTAviewModel.fetchAddress(forCoordinate: coordinate) { result in
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
