//
//  WeatherDataModel.swift
//  checklist
//


import Foundation

struct OpenWeatherResponse: Decodable {
    let name: String
    let main: OpenWeatherMain
    let weather: [OpenWeatherWeather]
    
    init(name: String, main: OpenWeatherMain, weather: [OpenWeatherWeather]) {
        self.name = name
        self.main = main
        self.weather = weather
    }
}

struct OpenWeatherMain: Decodable {
    let temp: Double
    let feels_like: Double
    init(temp: Double, feels_like: Double) {
        self.temp = temp
        self.feels_like = feels_like
    }
}


struct OpenWeatherWeather: Decodable {
    let description: String
    let main: String
    
    init(description: String, main: String) {
        self.description = description
        self.main = main
    }
}

public struct Weather {
    let location: String
    let temperature: String
    let feels_like: String
    let description: String
    let main: String
    let tempt: Int

    
    
    init(response: OpenWeatherResponse) {
        location = response.name
        
        temperature = "\(Int(response.main.temp))"
        feels_like = "\(Int(response.main.feels_like))"
        tempt = Int(response.main.feels_like)
        
        // 날씨 조작용. 윗줄 주석 처리하고 더울때/차가울때 선택해서 해제
        //tempt = 40
        //tempt = -10
        
        description = response.weather.first?.description ?? ""
        main = response.weather.first?.main ?? ""
        
        //비 내리기 조작용
        //main = "Rain"


    }
    
    
    
}
