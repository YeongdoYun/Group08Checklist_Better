//
//  startPage.swift
//  checklist
//

import SwiftUI
import CoreLocationUI

struct StartView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {

                Text("Safety Checklist").font(.largeTitle).padding().multilineTextAlignment(.center)
                Text("Location information is required for this app").font(.caption).padding().multilineTextAlignment(.center)
            
                LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
                }.cornerRadius(10).foregroundColor(.white)
        }
    }
}

