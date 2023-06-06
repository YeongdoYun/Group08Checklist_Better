//
//  checklistApp.swift
//  checklist
//
//
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

