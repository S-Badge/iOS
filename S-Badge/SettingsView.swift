//
//  SettingsView.swift
//  S-Badge
//
//  Created by ram on 2023/07/30.
//

import Foundation
import SwiftUI
import UserNotifications

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("이어폰으로 알림 읽어주기 기능을 활성화해주세요.")
                .padding()
            
            Button("알림 권한 요청", action: requestNotificationPermission)
                .padding()
        }
    }
    
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("알림 권한이 허용되었습니다.")
            } else {
                print("알림 권한이 거부되었습니다.")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
