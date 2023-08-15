import SwiftUI

struct CommentMapView: View {
    @Binding var isPresented: Bool // 댓글 창 표시 여부
    
    @State private var selectedAddress: String = "" // 선택된 주소
    @State private var comment: String = "" // 댓글 내용
    
    let addresses = [
        "서울시 종로1가 10",
        "서울시 서초구 반포1동",
        "서울시 동작구 상도로",
        "서울시 강남구 테헤란로",
        "서울시 송파구 장지동"
    ]
    
    var body: some View {
        VStack {
            Picker("주소 선택", selection: $selectedAddress) {
                ForEach(addresses, id: \.self) { address in
                    Text(address)
                }
            }
            .pickerStyle(.wheel) // 피커 스타일을 wheel로 설정
            .padding()
            
            TextEditor(text: $comment)
                .frame(height: 200)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .border(Color.gray.opacity(0.5), width: 1) // 얇은 실선 추가
                .padding(20)
            
            Button(action: {
                // 댓글 작성 버튼을 누를 때 처리
                // 이 부분을 원하는 동작으로 수정해주세요
                print("댓글 작성 버튼 눌림")
                print("선택된 주소:", selectedAddress)
                print("댓글 내용:", comment)
                
                // 댓글 작성 완료 후 창 닫기
                isPresented = false
            }) {
                Text("댓글 작성")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding()
        .onAppear{
            comment = AppDelegate.fcmToken!
        }
        
    }
}


struct CommentMapView_Previews: PreviewProvider {
    static var previews: some View {
        CommentMapView(isPresented: .constant(true))
    }
}
