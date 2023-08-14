import Foundation
import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    var db: Firestore! // Firestore 인스턴스 생성
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // 파이어베이스 설정
        FirebaseApp.configure()
        // Firestore 인스턴스 초기화
        db = Firestore.firestore()
        // 앱 실행 시 사용자에게 알림 허용 권한을 받음
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound] // 필요한 알림 권한을 설정
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )
        
        // UNUserNotificationCenterDelegate를 구현한 메서드를 실행시킴
        application.registerForRemoteNotifications()
        
        // 파이어베이스 Meesaging 설정
        Messaging.messaging().delegate = self
        
        
        return true
    }
}


extension AppDelegate: MessagingDelegate {
    
    // 파이어베이스 MessagingDelegate 설정
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
        
        // Firestore에 FCM 토큰 저장
        if let fcmToken = fcmToken {
            let timestamp = Timestamp(date: Date())
            let data: [String: Any] = [
                "FCMToken": fcmToken,
                "timestamp": timestamp
            ]
            
            // "Token" 컬렉션의 "device" 문서에 저장
            db.collection("Token").document("device").setData(data) { error in
                if let error = error {
                    print("Error saving FCM token to Firestore: \(error)")
                } else {
                    print("FCM token saved to Firestore")
                }
            }
        }
        
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // 백그라운드에서 푸시 알림을 탭했을 때 실행
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("APNS token: \(deviceToken)")
        Messaging.messaging().apnsToken = deviceToken
    }
    
    // Foreground(앱 켜진 상태)에서도 알림 오는 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner])
    }
}
