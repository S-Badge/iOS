//
//  S_BadgeApp.swift
//  S-Badge
//
//  Created by ram on 2023/07/23.
//

import SwiftUI

@main
struct S_BadgeApp: App {
    /* AppDelegate의 기능을 SwiftUI에서 호출 */
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
