//
//  WeatherModel.swift
//  swelter
//
//  Created by Isaac Mackle on 4/6/20.
//  Copyright © 2020 Isaac Mackle. All rights reserved.
//


import Foundation

struct WeatherModel {
    let conditionId: Int
    let conditionDescription: String
    let cityName: String
    let temperature: TimeInterval
    let sunriseTime: TimeInterval
    let sunsetTime: Double
    let windSpeed: Double
    
    init(dataModel: WeatherData) {
        self.conditionId = dataModel.weather[0].id
        self.temperature = dataModel.main.temp
        self.cityName = dataModel.name
        self.windSpeed = dataModel.wind.speed
        self.conditionDescription = dataModel.weather[0].description
        self.sunriseTime = dataModel.sys.sunrise
        self.sunsetTime = dataModel.sys.sunset
    }
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var sunriseString: String {
        return convertUnixTime(time: sunriseTime)
    }
    
    var sunsetString: String {
        return convertUnixTime(time: sunsetTime)
    }
    
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}

func convertUnixTime(time: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: time)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm a"
    
    return dateFormatter.string(from: date)
}
