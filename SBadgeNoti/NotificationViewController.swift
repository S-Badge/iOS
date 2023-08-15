//import UIKit
//import UserNotifications
//import UserNotificationsUI
//import AVFoundation
//
//class NotificationViewController: UIViewController, UNNotificationContentExtension {
//    @IBOutlet var label: UILabel?
//    var synthesizer: AVSpeechSynthesizer?
//    
//    func didReceive(_ notification: UNNotification) {
//        self.label?.text = notification.request.content.body
//        
//        // 푸시 알림의 텍스트 내용을 가져옴
//        let text = notification.request.content.body
//        
//        // AVSpeechSynthesizer 인스턴스 생성
//        synthesizer = AVSpeechSynthesizer()
//        
//        // AVSpeechUtterance를 사용하여 텍스트를 음성으로 변환하도록 설정
////        let utterance = AVSpeechUtterance(string: text)
//        let utterance = AVSpeechUtterance(string: "안녕하세요")
//        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
//        
//        // AVSpeechSynthesizer를 사용하여 음성 출력
//        synthesizer?.speak(utterance)
//    }
//    
//    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
//        completion(.doNotDismiss)
//    }
//}
