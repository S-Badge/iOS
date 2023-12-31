//
//  CommentButton.swift
//  S-Badge
//
//  Created by ram on 2023/08/16.
//

import SwiftUI

struct CommentButton: View {
    @State private var isCommentSheetPresented = false
    let circleSize:CGFloat = 30
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                
                
                Button(action: {
                    isCommentSheetPresented.toggle() // 버튼을 누를 때 댓글 창 표시 여부 변경
                }) {
                    Image(systemName: "bubble.left.and.bubble.right") // 동그라미 아이콘
                        .padding(20) // 버튼 내부의 패딩
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    
                    
                }
                .frame(width: circleSize,height: circleSize,alignment: .bottomTrailing)
                .padding(20) // 버튼의 마진 조정
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                .sheet(isPresented: $isCommentSheetPresented) {
                    // 댓글 작성 창을 띄우는 코드
                    CommentMapView(isPresented: $isCommentSheetPresented)
                }
            }
        }
    }
}
