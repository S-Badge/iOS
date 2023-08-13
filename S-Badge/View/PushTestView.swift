//
//  PushTestView.swift
//  S-Badge
//
//  Created by ram on 2023/08/08.
//

import Foundation
import SwiftUI
import UserNotifications

struct PushTestView: View {
    var body: some View {
        VStack {
            Spacer()
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
            Spacer()
        }
    }

    // 푸시 알림을 전송하는 함수
    func sendLocalNotification(titleText: String, bodyText: String) {
        let content = UNMutableNotificationContent()
        content.title = titleText
        content.body = bodyText
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "pushNotification", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error sending local notification: \(error.localizedDescription)")
            }
        }
    }
}
