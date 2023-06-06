//
//  result.swift
//  checklist
//

import Foundation
import SwiftUI



struct ResultView: View {
    var openWeatherResponse: OpenWeatherResponse
    var WorkingCheck: [Bool]
    var EquipCheck: [Bool]
    
    var WeatherAnswer: [[Bool]]
    var WorkingAnswer: [[Bool]]
    var EquipAnswer: [[Bool]]

    
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
    
    
    
    private var checkedCounter: Int {
        var count = 0
        for i in 0...9 {
            for j in 0...9 {
                if WeatherAnswer[i][j] {
                    count += 1
                }
                if WorkingAnswer[i][j] {
                    count += 1
                }
                if EquipAnswer[i][j] {
                    count += 1
                }
            }
        }
        return count
    }
    
    
    
    private var uncheckedweather: [Int] {
        var countarr = Array(repeating: 0,count:10)
        if Weather(response: openWeatherResponse).tempt > 30 {
            for i in 1...Questions().hotnumber {
                if WeatherAnswer[0][i-1] == false {
                    countarr[0] += 1
                }
            }
        }
        if Weather(response: openWeatherResponse).tempt < 0 {
            for i in 1...Questions().coldnumber {
                if WeatherAnswer[1][i-1] == false {
                    countarr[1] += 1
                }
            }
        }
        if Weather(response: openWeatherResponse).main == "Rain" {
            for i in 1...Questions().rainnumber {
                if WeatherAnswer[2][i-1] == false {
                    countarr[2] += 1
                }
            }
        }
        return countarr
    }
    
    
    
    private var uncheckedwork: [Int] {
        var countarr = Array(repeating: 0,count:10)
        
        for i in 0...9 {
            if WorkingCheck[i] {
                if i == Questions().AAAid {
                    for j in 1...Questions().AAAnumber {
                        if WorkingAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
                if i == Questions().BBBid {
                    for j in 1...Questions().BBBnumber {
                        if WorkingAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
                if i == Questions().CCCid {
                    for j in 1...Questions().CCCnumber {
                        if WorkingAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
                if i == Questions().DDDid {
                    for j in 1...Questions().DDDnumber {
                        if WorkingAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
                if i == Questions().EEEid {
                    for j in 1...Questions().EEEnumber {
                        if WorkingAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
            }
        }
        return countarr
    }
    
    
    private var uncheckedequip: [Int] {
        var countarr = Array(repeating: 0,count:10)
        
        for i in 0...9 {
            if EquipCheck[i] {
                if i == Questions().MCid {
                    for j in 1...Questions().MCnumber {
                        if EquipAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
                if i == Questions().EXid {
                    for j in 1...Questions().EXnumber {
                        if EquipAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
                if i == Questions().DFid {
                    for j in 1...Questions().DFnumber {
                        if EquipAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
                if i == Questions().EWid {
                    for j in 1...Questions().EWnumber {
                        if EquipAnswer[i][j-1] == false {
                            countarr[i] += 1
                        }
                    }
                }
            }
        }
        return countarr
    }
    
    private var uncheckedCounter: Int {
        var count = 0
        for i in 0...9 {
            count += uncheckedweather[i]
            count += uncheckedwork[i]
            count += uncheckedequip[i]
        }

        return count
    }
    
    private var totalscore: Int {
        var score = 0
        
        var x = 0.0
        var y = 0.0
        var temp = 0.0
        x = Double(checkedCounter)
        y = Double(checkedCounter + uncheckedCounter)
        if y != 0 {
            temp = (x / y) * 100
        }
        score = Int(temp)
        
        return score
    }
    
    
    var body: some View {

        Form {
            Section(header: Text("Summary").font(.system(size: 25)).foregroundColor(Color.black)) {
                VStack {
                    Text("Safety Score").font(.largeTitle).padding()
                    Text("\(totalscore)").font(.system(size: 75)).bold()
                    
                    Text("Unchecked Items").font(.largeTitle).padding()
                    Text("\(uncheckedCounter)").font(.system(size: 75)).bold().foregroundColor(Color.red)
                    
                    Text("Checked Items").font(.largeTitle).padding()
                    Text("\(checkedCounter)").font(.system(size: 75)).bold().padding().foregroundColor(Color.blue)
                }
                
            }
            
            Section(header: Text("Weather").font(.system(size: 25)).foregroundColor(Color.black)) {
                if noweather {
                    Text("Normal Weather").font(.system(size: 20)).foregroundColor(.green)
                }
                if Weather(response: openWeatherResponse).tempt > 30 {
                    Text("Hot Weather").font(.system(size: 20)).foregroundColor(.green)
                    ForEach((1...Questions().hotnumber), id: \.self) { i in
                        if WeatherAnswer[0][i-1] == false {
                            Text("\(Questions().hotQuestions[i-1])\n").font(.system(size: 15)).foregroundColor(.red)
                        }
                    }
                    if uncheckedweather[0] == 0 {
                        Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                    }
                    Spacer()
                    
                }
                if Weather(response: openWeatherResponse).tempt < 0 {
                    Text("Cold Weather").font(.system(size: 20)).foregroundColor(.green)
                    ForEach((1...Questions().coldnumber), id: \.self) { i in
                        if WeatherAnswer[1][i-1] == false {
                            Text("\(Questions().coldQuestions[i-1])\n").font(.system(size: 15)).foregroundColor(.red)
                        }
                    }
                    if uncheckedweather[1] == 0 {
                        Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                    }
                    Spacer()
                }
                if Weather(response: openWeatherResponse).main == "Rain" {
                    Text("Rainy Weather").font(.system(size: 20)).foregroundColor(.green)
                    ForEach((1...Questions().rainnumber), id: \.self) { i in
                        if WeatherAnswer[2][i-1] == false {
                            Text("\(Questions().rainQuestions[i-1])\n").font(.system(size: 15)).foregroundColor(.red)
                        }
                    }
                    if uncheckedweather[2] == 0 {
                        Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                    }
                    Spacer()
                    
                }
                
                
            }
            
            
            
            Section(header: Text("Responsible Works").font(.system(size: 25)).foregroundColor(Color.black)) {
                if noworking {
                    Text("No works").font(.system(size: 20)).foregroundColor(.green)
                }
                ForEach((1...checkcounter().Allwork), id: \.self){ i in
                    if WorkingCheck[i-1] {
                        if i-1 == Questions().AAAid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().AAAnumber), id: \.self) { j in
                                if WorkingAnswer[Questions().AAAid][j-1] == false {
                                    Text("\(Questions().AAAQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedwork[Questions().AAAid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            
                            Spacer()
                        }
                        if i-1 == Questions().BBBid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().BBBnumber), id: \.self) { j in
                                if WorkingAnswer[Questions().BBBid][j-1] == false {
                                    Text("\(Questions().BBBQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedwork[Questions().BBBid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            
                            Spacer()
                        }
                        if i-1 == Questions().CCCid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().CCCnumber), id: \.self) { j in
                                if WorkingAnswer[Questions().CCCid][j-1] == false {
                                    Text("\(Questions().CCCQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedwork[Questions().CCCid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            
                            Spacer()
                        }
                        if i-1 == Questions().DDDid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().DDDnumber), id: \.self) { j in
                                if WorkingAnswer[Questions().DDDid][j-1] == false {
                                    Text("\(Questions().DDDQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedwork[Questions().DDDid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            
                            Spacer()
                        }
                        if i-1 == Questions().EEEid {
                            Text("\(checkcounter().Workinglist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().EEEnumber), id: \.self) { j in
                                if WorkingAnswer[Questions().EEEid][j-1] == false {
                                    Text("\(Questions().EEEQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedwork[Questions().EEEid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            
                            Spacer()
                        }

                    }
                }
            }
            
            
            
            
            Section(header: Text("Equipments").font(.system(size: 25)).foregroundColor(Color.black)) {
                if noequip {
                    Text("No Equipments").font(.system(size: 20)).foregroundColor(.green)
                }
                ForEach((1...checkcounter().Allequip), id: \.self){ i in
                    if EquipCheck[i-1] {
                        if i-1 == Questions().MCid {
                            Text("\(checkcounter().Equiplist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().MCnumber), id: \.self) { j in
                                if EquipAnswer[Questions().MCid][j-1] == false {
                                    Text("\(Questions().MCQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedequip[Questions().MCid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        if i-1 == Questions().EXid {
                            Text("\(checkcounter().Equiplist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().EXnumber), id: \.self) { j in
                                if EquipAnswer[Questions().EXid][j-1] == false {
                                    Text("\(Questions().EXQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedequip[Questions().EXid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        if i-1 == Questions().DFid {
                            Text("\(checkcounter().Equiplist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().DFnumber), id: \.self) { j in
                                if EquipAnswer[Questions().DFid][j-1] == false {
                                    Text("\(Questions().DFQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedequip[Questions().DFid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        if i-1 == Questions().EWid {
                            Text("\(checkcounter().Equiplist[i-1])").font(.system(size: 20)).foregroundColor(.green)
                            ForEach((1...Questions().EWnumber), id: \.self) { j in
                                if EquipAnswer[Questions().EWid][j-1] == false {
                                    Text("\(Questions().EWQuestions[j-1])\n").font(.system(size: 15)).foregroundColor(.red)
                                }
                            }
                            if uncheckedequip[Questions().EWid] == 0 {
                                Text("All checked!").font(.system(size: 15)).foregroundColor(.blue)
                            }
                            Spacer()
                        }
                    }
                }
            }
            
            
            
            
            
            
        }
    }
}
