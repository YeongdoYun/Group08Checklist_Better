//
//  secondPage.swift
//  checklist
//

import SwiftUI

struct ChecklistView: View {
    @State private var selectedItems: [String] = []
    
    
    var openWeatherResponse: OpenWeatherResponse
    var WorkingCheck: [Bool]
    var EquipCheck: [Bool]
    
    
    @State private var WorkingAnswer = Array(repeating: Array(repeating: false,count:10 ), count: 10)
    @State private var WeatherAnswer = Array(repeating: Array(repeating: false,count:10 ), count: 10)
    @State private var EquipAnswer = Array(repeating: Array(repeating: false,count:10 ), count: 10)
    

    private var noweather: Bool {
        if Weather(response: openWeatherResponse).tempt > 30 {
            return false
        }
        if Weather(response: openWeatherResponse).tempt < 0 {
            return false
        }
        if Weather(response: openWeatherResponse).main == "Rain" {
            return false
        }
        
        return true
    }
    
    private var noworking: Bool {
        var count = 0
        for i in 0...9 {
            if WorkingCheck[i] {
                count += 1
            }
        }
        if count == 0 {
            return true
        } else {
            return false
        }
    }
    
    private var noequip: Bool {
        var count = 0
        for i in 0...9 {
            if EquipCheck[i] {
                count += 1
            }
        }
        if count == 0 {
            return true
        } else {
            return false
        }
        
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Weather").font(.system(size: 27)).foregroundColor(Color.black)) {
                
                if noweather {
                    Text("Normal Weather").font(.system(size: 20)).foregroundColor(.green)
                }
                if Weather(response: openWeatherResponse).tempt > 30 {
                    Text("Hot Weather").font(.system(size: 20)).foregroundColor(.green)
                    ForEach((1...Questions().hotnumber), id: \.self) { i in
                        Text("\(Questions().hotQuestions[i-1])\n")
                            .font(.system(size: 15))
                        Toggle("Q.\(i) Checked?", isOn: $WeatherAnswer[0][i-1]).font(.system(size: 15)).foregroundColor(.red)
                    }
                    Spacer()
                    
                }
                if Weather(response: openWeatherResponse).tempt < 0 {
                    Text("Cold Weather").font(.system(size: 20)).foregroundColor(.green)
                    ForEach((1...Questions().coldnumber), id: \.self) { i in
                        Text("\(Questions().coldQuestions[i-1])\n")
                            .font(.system(size: 15))
                        Toggle("Q.\(i) Checked?", isOn: $WeatherAnswer[1][i-1]).font(.system(size: 15)).foregroundColor(.red)
                    }
                    Spacer()
                    
                }
                if Weather(response: openWeatherResponse).main == "Rain" {
                    Text("Rainy Weather").font(.system(size: 20)).foregroundColor(.green)
                    ForEach((1...Questions().rainnumber), id: \.self) { i in
                        Text("\(Questions().rainQuestions[i-1])\n")
                            .font(.system(size: 15))
                        Toggle("Q.\(i) Checked?", isOn: $WeatherAnswer[2][i-1]).font(.system(size: 15)).foregroundColor(.red)
                    }
                    Spacer()
                    
                }
                

            }
            
            
            Section(header: Text("Responsible Works").font(.system(size: 27)).foregroundColor(Color.black)) {
                if noworking {
                    Text("No works").font(.system(size: 20)).foregroundColor(.green)
                }
                
                ForEach((1...checkcounter().Allwork), id: \.self){ i in
                    if WorkingCheck[i-1] {
                        if i-1 == Questions().AAAid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().AAAnumber), id: \.self) { j in
                                Text("\(Questions().AAAQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $WorkingAnswer[Questions().AAAid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()
                            
                        }
                        if i-1 == Questions().BBBid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().BBBnumber), id: \.self) { j in
                                Text("\(Questions().BBBQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $WorkingAnswer[Questions().BBBid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()
                            
                        }
                        if i-1 == Questions().CCCid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().CCCnumber), id: \.self) { j in
                                Text("\(Questions().CCCQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $WorkingAnswer[Questions().CCCid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()
                            
                        }
                        if i-1 == Questions().DDDid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().DDDnumber), id: \.self) { j in
                                Text("\(Questions().DDDQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $WorkingAnswer[Questions().DDDid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()
                            
                        }
                        if i-1 == Questions().EEEid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().EEEnumber), id: \.self) { j in
                                Text("\(Questions().EEEQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $WorkingAnswer[Questions().EEEid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()
                            
                        }
                        
                    }
                }
                
                
                
            }
            
            
            
            Section(header: Text("Equipments").font(.system(size: 27)).foregroundColor(Color.black)) {
                
                if noequip {
                    Text("No Equipments").font(.system(size: 20)).foregroundColor(.green)
                }
                ForEach((1...checkcounter().Allequip), id: \.self){ i in
                    if EquipCheck[i-1] {
                        if i-1 == Questions().MCid {
                            Text("\(checkcounter().Equiplist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().MCnumber), id: \.self) { j in
                                Text("\(Questions().MCQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $EquipAnswer[Questions().MCid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()

                        }

                        if i-1 == Questions().EXid {
                            Text("\(checkcounter().Equiplist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().EXnumber), id: \.self) { j in
                                Text("\(Questions().EXQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $EquipAnswer[Questions().EXid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()

                        }
                        if i-1 == Questions().DFid {
                            Text("\(checkcounter().Equiplist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().DFnumber), id: \.self) { j in
                                Text("\(Questions().DFQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $EquipAnswer[Questions().DFid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()

                        }
                        if i-1 == Questions().EWid {
                            Text("\(checkcounter().Equiplist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().EWnumber), id: \.self) { j in
                                Text("\(Questions().EWQuestions[j-1])\n")
                                    .font(.system(size: 15))
                                Toggle("Q.\(j) Checked?", isOn: $EquipAnswer[Questions().EWid][j-1]).font(.system(size: 15)).foregroundColor(.red)
                            }
                            Spacer()

                        }

                    }
                }



            }
            
            
            
            
            NavigationLink(destination: ResultView(openWeatherResponse: openWeatherResponse, WorkingCheck: WorkingCheck, EquipCheck: EquipCheck, WeatherAnswer: WeatherAnswer, WorkingAnswer: WorkingAnswer, EquipAnswer: EquipAnswer)){
                    Text("Summary").font(.headline).foregroundColor(.white).frame(height: 55).frame(maxWidth: .infinity).background(Color.blue).cornerRadius(10)
            }

        }
                           
    }
                           
                           
}


