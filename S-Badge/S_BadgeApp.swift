//
//  S_BadgeApp.swift
//  S-Badge
//
//  Created by ram on 2023/07/23.
//

import SwiftUI
import FirebaseCore

@main
struct S_BadgeApp: App {
    /* AppDelegate의 기능을 SwiftUI에서 호출 */
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var appAccentColor = Color.orange // 원하는 색상으로 변경 가능
    var body: some Scene {
        WindowGroup {
            MainView()
                .accentColor(appAccentColor) // 앱 전체에서 사용할 강조 색상 설정
        }
    }
}
