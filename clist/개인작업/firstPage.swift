//
//  firstPage.swift
//  checklist
//


import SwiftUI
import CoreLocationUI

struct FirstView: View {
    var openWeatherResponse: OpenWeatherResponse
    
    private let iconList = [
        "Clear": "☀️",
        "Clouds": "☁️",
        "Mist": "☁️",
        "": "?",
        "Drizzle": "🌧",
        "Thunderstorm": "⛈",
        "Rain": "🌧",
        "Snow": "🌨"
    ]
    
    @State private var WorkingCheck = Array(repeating: false, count: 10)
    @State private var EquipCheck = Array(repeating: false, count: 10)
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Today's Weather")
                                    .font(.system(size: 27))
                                    .foregroundColor(Color.black)) {
                    VStack {
                        Text(Weather(response: openWeatherResponse).location)
                            .font(.largeTitle)
                            .padding()
                        Text(Weather(response: openWeatherResponse).temperature)
                            .font(.system(size: 75))
                            .bold()
                        Text("Apparent temperature \(Weather(response: openWeatherResponse).feels_like)")
                            .font(.system(size: 15))
                            .bold()
                        Text(iconList[Weather(response: openWeatherResponse).main] ?? "")
                            .font(.largeTitle)
                            .padding()
                        Text(Weather(response: openWeatherResponse).description)
                            .font(.largeTitle)
                            .padding()
                    }
                }
                
                Section(header: Text("Responsible Works")
                                    .font(.system(size: 27))
                                    .foregroundColor(Color.black)) {
                    VStack {
                        ForEach((1...checkcounter().Allwork), id: \.self) { i in
                            Toggle("\(checkcounter().Workinglist[i-1])", isOn: $WorkingCheck[i-1]).font(.system(size: 15))
                        }
                        Spacer()
                    }
                }
                
                
                Section(header: Text("Equipments")
                                    .font(.system(size: 27))
                                    .foregroundColor(Color.black)) {
                    VStack {
                        ForEach((1...checkcounter().Allequip), id: \.self) { i in
                            Toggle("\(checkcounter().Equiplist[i-1])", isOn: $EquipCheck[i-1]).font(.system(size: 15))
                        }
                        Spacer()
                    }
                }
                
                
                Section {
                    NavigationLink(destination: ChecklistView(openWeatherResponse: openWeatherResponse, WorkingCheck: WorkingCheck, EquipCheck: EquipCheck)) {
                        Text("Go to List")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}


