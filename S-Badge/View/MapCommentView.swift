import SwiftUI

struct MapCommentView: View {
    @Binding var isPresented: Bool // 댓글 창 표시 여부
    
    @State private var comment: String = "" // 댓글 내용
    
    var body: some View {
        VStack {
            TextEditor(text: $comment)
                .frame(height: 100)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            
            Button(action: {
                // 댓글 작성 버튼을 누를 때 처리
                // 이 부분을 원하는 동작으로 수정해주세요
                print("댓글 작성 버튼 눌림")
                
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
    }
}

struct MapCommentView_Previews: PreviewProvider {
    static var previews: some View {
        MapCommentView(isPresented: .constant(true))
    }
}
