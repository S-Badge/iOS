//
//  MapView.swift
//  S-Badge
//
//  Created by ram on 2023/07/29.
//
import Foundation
import SwiftUI
import UserNotifications
import Speech

struct PushTestView: View {
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

    func sendLocalNotification(titleText: String, bodyText: String) {
        let content = UNMutableNotificationContent()
        content.title = titleText
        content.body = bodyText
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error sending local notification: \(error)")
            } else {
                print("Local notification sent successfully.")
            }
        }
    }

    // iOS 15 이상에서만 지원되는 음성 합성 메서드
    func speak(text: String) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        synthesizer.speak(utterance)
    }

    // 푸시 알림 수신 시 호출되는 메서드
    func handleNotification(_ notification: UNNotification) {
        if #available(iOS 15.0, *) {
            let body = notification.request.content.body
            speak(text: body)
        } else {
            print("음성 합성은 iOS 15 이상에서만 지원됩니다.")
        }
    }
}
