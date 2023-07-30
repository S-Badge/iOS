//
//  MapView.swift
//  S-Badge
//
//  Created by ram on 2023/07/29.
//

import SwiftUI
import UserNotifications
import AVFoundation

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
        .onAppear {
            UNUserNotificationCenter.current().delegate = NotificationDelegate()
        }
    }
}

// Function to send local notification
func sendLocalNotification(titleText: String, bodyText: String) {
    let center = UNUserNotificationCenter.current()

    let content = UNMutableNotificationContent()
    content.title = titleText
    content.body = bodyText
    content.sound = .default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

    center.add(request) { error in
        if let error = error {
            print("Error sending notification: \(error.localizedDescription)")
        } else {
            print("Notification sent successfully.")
        }
    }
}

// Notification Delegate to handle notifications when app is in background or foreground
class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // When notification is received, wait for 5 seconds and then read the notification content
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.readNotificationContent(response.notification)
        }
        completionHandler()
    }

    private func readNotificationContent(_ notification: UNNotification) {
        let content = notification.request.content
        let synthesizer = AVSpeechSynthesizer()

        let utterance = AVSpeechUtterance(string: content.body)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR") // Change to your preferred language

        synthesizer.speak(utterance)
    }
}
