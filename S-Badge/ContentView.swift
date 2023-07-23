//
//  ContentView.swift
//  S-Badge
//
//  Created by ram on 2023/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                sendLocalNotification(titleText: "푸시 알림 테스트", bodyText: "테스트 본문")
            }){
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("푸시 알림 테스트")
                    .padding()
                    
            }
            .padding()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
