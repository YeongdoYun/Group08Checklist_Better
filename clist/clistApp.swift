//
//  checklistApp.swift
//  checklist
//
//

//  기존 체크리스트 어플과는 체크 방식이 완전히 다른데, 디자인이나 사용성이 좀 더 개선된 버전입니다. 이건 제가 따로 만든거라 따로 올려요


import SwiftUI
@main
struct checklistApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}

