//
//  SettingsView.swift
//  S-Badge
//
//  Created by ram on 2023/07/30.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("이어폰으로 알림 읽어주기 기능을 활성화해주세요.")
                .padding()
            
            Button("앱 설정으로 이동", action: openAppSettings)
                .padding()
            Spacer()
        }
    }
    
    private func openAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(settingsUrl)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
