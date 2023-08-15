//
//  MainView.swift
//  S-Badge
//
//  Created by ram on 2023/07/28.
//
import SwiftUI
import CoreLocation

struct MainView: View {
    // State 변수를 사용하여 현재 선택된 탭을 추적합니다.
    @State private var selectedTab: Tab = .map

    enum Tab {
        case map
        case community
        case settings
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            // 첫 번째 탭: 지도
            NaverView()
                .tabItem {
                    Label("지도", systemImage: "map")
                }
                .tag(Tab.map)

            // 두 번째 탭: 커뮤니티
            FloatingAddressBar(coordinate: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780))
                .tabItem {
                    Label("커뮤니티", systemImage: "message")
                }
                .tag(Tab.community)

            // 세 번째 탭: 설정
            TempView()
                .tabItem {
                    Label("설정", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
    }
}




