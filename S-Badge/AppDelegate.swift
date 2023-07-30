import UIKit
import UserNotifications
import Intents

import UIKit
import UserNotifications


class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    // 알림이 백그라운드에서 도착하면 해당 메서드가 호출됨
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // 알림을 받아서 처리하는 로직을 구현
        if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            let content = response.notification.request.content
            let title = content.title
            let body = content.body

            // 이 부분에서 알림을 처리하는 로직을 추가할 수 있습니다.
            // 예를 들면 알림 창을 띄우거나, 다른 작업을 수행할 수 있습니다.

            print("Received notification in the background:")
            print("Title: \(title)")
            print("Body: \(body)")
        }

        completionHandler()
    }
}
