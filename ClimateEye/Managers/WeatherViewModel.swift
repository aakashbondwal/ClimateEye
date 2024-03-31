//
//  WeatherViewModel.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//

import Foundation
import WeatherKit
import CoreLocation
import SwiftUI
import SpriteKit



class WeatherViewModel: ObservableObject {
    
    @Published private(set) var todayDate = String()
    @Published private(set) var currentCity = String()
    @Published private(set) var currentTemperature = String()
    @Published private(set) var currentWeatherImage = String()
    @Published private(set) var currentCondition = String()
    @Published private(set) var currentPressure = String()
    @Published private(set) var currentPressureTrend = String()
    @Published private(set) var currentUVIndex = String()
    @Published private(set) var currentHumidity = String()
    @Published private(set) var currentDewPoint = String()
    @Published private(set) var currentWindSpeed = String()
    @Published private(set) var currentWindGust = String()
    @Published private(set) var currentWindDirection = String()
    @Published private(set) var currentVisiblity = String()
    @Published private(set) var currentFeelsLike = String()
    @Published private(set) var currentPrecipitationChance = String()
    @Published private(set) var currentPrecipitationAmount = String()
    @Published private(set) var currentCloudCover = String()
    @Published private(set) var currentDayLight = Bool()
    @Published private(set) var currentPrecipitation = String()
    @Published private(set) var todayMoonrise = String()
    @Published private(set) var todayMoonset = String()
    @Published private(set) var todayMoonPhase = String()
    @Published private(set) var todayMoonPhaseImage = String()
    @Published private(set) var todaySunRise = String()
    @Published private(set) var todaySunSet = String()
    @Published private(set) var sunAstronomicalDawn = String()
    @Published private(set) var sunAstronomicalDusk = String()
    @Published private(set) var sunCivilDawn = String()
    @Published private(set) var sunCivilDusk = String()
    @Published private(set) var sunSolarMidNight = String()
    @Published private(set) var sunSolarNoon = String()
    @Published private(set) var sunNauticalDawn = String()
    @Published private(set) var sunNauticalDusk = String()
    @Published private(set) var currentHighLow = "H:0 L:0"
    @Published private(set) var hourlyForecast = [HourWeatherData]()
    @Published private(set) var tenDaysForecast = [DayWeather]()
    @Published private(set) var tenDaysMoonEvents = [MoonEvents]()
    @Published private(set) var tenDaysSunEvents = [SunEvents]()
    @Published private(set) var hourlyPressure = [PressureDetails]()
    @Published private(set) var hourlyUVIndex = [HourUVIndex]()
    @Published private(set) var tenDaysChancesOfRain = [daysChanceOfRain]()
    @Published private(set) var nightCurrentWeatherImage = String()

 
    let weatherService = WeatherService.shared

    func fetchCurrentWeather(userLocation: CLLocation) {
        Task {
            do {
                
                let weather = try await weatherService.weather(for: userLocation)
                
                DispatchQueue.main.async {
    
                    self.todayDate = weather.currentWeather.date.formatted(date: .complete, time: .omitted)
                    self.currentTemperature = formatTemperature(weather.currentWeather.temperature)
                    self.currentCondition = weather.currentWeather.condition.description
                    self.nightCurrentWeatherImage = weather.currentWeather.condition.nightConditionImage
                    self.currentWeatherImage = weather.currentWeather.condition.conditionImage
                    self.currentPressure = weather.currentWeather.pressure.converted(to: .poundsForcePerSquareInch).value.rounded().formatted()
                    self.currentPressureTrend = weather.currentWeather.pressureTrend.rawValue
                    self.currentUVIndex = weather.currentWeather.uvIndex.value.formatted()
                    self.currentHumidity = weather.currentWeather.humidity.formatted()
                    self.currentDewPoint = formatTemperature(weather.currentWeather.dewPoint)
                    self.currentHumidity = weather.currentWeather.humidity.rounded().formatted()
                    self.currentHighLow = "H:\(formatTemperature(weather.dailyForecast.forecast[0].highTemperature))  |  L: \(formatTemperature(weather.dailyForecast.forecast[0].lowTemperature))"
                    self.currentWindGust = weather.currentWeather.wind.gust?.formatted() ?? "nil"
                    self.currentCloudCover = weather.currentWeather.cloudCover.formatted()
                    self.currentDayLight = weather.currentWeather.isDaylight
                    self.currentWindSpeed = weather.currentWeather.wind.speed.formatted()
                    self.currentWindDirection = weather.currentWeather.wind.compassDirection.rawValue
                    self.currentFeelsLike = formatTemperature(weather.currentWeather.apparentTemperature)
                    self.currentVisiblity = weather.currentWeather.visibility.formatted()
                    self.currentPrecipitation = weather.dailyForecast.forecast[0].precipitation.rawValue
                    self.currentPrecipitationAmount = weather.dailyForecast.forecast[0].precipitationAmount.formatted()
                    self.currentPrecipitationChance = weather.dailyForecast.forecast[0].precipitationChance.formatted()
                    self.todayMoonset = weather.dailyForecast.forecast[0].moon.moonset?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.todayMoonrise = weather.dailyForecast.forecast[0].moon.moonrise?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.todayMoonPhase = weather.dailyForecast.forecast[0].moon.phase.description
                    self.todayMoonPhaseImage = weather.dailyForecast.forecast[0].moon.phase.symbolName
                    self.todaySunSet = weather.dailyForecast.forecast[0].sun.sunset?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.todaySunRise = weather.dailyForecast.forecast[0].sun.sunrise?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.sunAstronomicalDawn = weather.dailyForecast.forecast[0].sun.astronomicalDawn?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.sunAstronomicalDusk = weather.dailyForecast.forecast[0].sun.astronomicalDusk?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.sunCivilDawn = weather.dailyForecast.forecast[0].sun.civilDawn?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.sunCivilDusk = weather.dailyForecast.forecast[0].sun.civilDusk?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.sunSolarNoon = weather.dailyForecast.forecast[0].sun.solarNoon?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.sunSolarMidNight = weather.dailyForecast.forecast[0].sun.solarMidnight?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.sunNauticalDawn = weather.dailyForecast.forecast[0].sun.nauticalDawn?.formatted(date: .omitted, time: .shortened) ?? "unknown"
                    self.sunNauticalDusk = weather.dailyForecast.forecast[0].sun.nauticalDusk?.formatted(date: .omitted, time: .shortened) ?? "unknown"
    

                  
                   
                    
                    //hourlyForecast

                    weather.hourlyForecast.forecast.forEach {
                        if self.isSameHourOrLater(date1: $0.date, date2: Date()) {
                            self.hourlyForecast.append(HourWeatherData(time: self.hourFormatter(date: $0.date), symbolName:  $0.condition.conditionImage, temperature: formatTemperature($0.temperature)))
                        }
                    }
                    
                    
                    //tendaysForecast
                    weather.dailyForecast.forecast.forEach {
                        self.tenDaysForecast.append(DayWeather(day: self.dayFormatter(date: $0.date),symbolName: $0.condition.conditionImage, lowTemperature: formatTemperature($0.lowTemperature), highTemperature: formatTemperature($0.highTemperature)))
                    }
                    
                    
                    //tenDaysMoonEvents
                    weather.dailyForecast.forecast.forEach {
                        self.tenDaysMoonEvents.append(MoonEvents(day: self.dayFormatter(date: $0.date), symbolName: $0.moon.phase.symbolName, moonRise: "\($0.moon.moonrise?.formatted(date: .omitted, time: .shortened) ?? "unknown")", moonSet: "\($0.moon.moonset?.formatted(date: .omitted, time: .shortened) ?? "unknown")"))
                    }
                    
                    //tenDaysSunEvents
                    weather.dailyForecast.forecast.forEach {
                        self.tenDaysSunEvents.append(SunEvents(day: self.dayFormatter(date: $0.date), sunRise: "\($0.sun.sunrise?.formatted(date: .omitted, time: .shortened) ?? "unkown")", sunSet: "\($0.sun.sunset?.formatted(date: .omitted, time: .shortened) ?? "unkown")"))
                    }
                    
                    //hourlyPressure
                    weather.hourlyForecast.forecast.forEach {
                        if self.isSameHourOrLater(date1: $0.date, date2: Date()) {
                            self.hourlyPressure.append(PressureDetails(hour: self.hourFormatter(date: $0.date), value: "\($0.pressure.value)"))
                        }
                        
                    }
                    
                    //hourUVchart
                    weather.hourlyForecast.forecast.forEach {
                        if self.isSameHourOrLater(date1: $0.date, date2: Date()) {
                            self.hourlyUVIndex.append(HourUVIndex(hour: self.hourFormatter(date: $0.date), value: $0.uvIndex.value.formatted()))
                        }
                    }
                    
                    //daysChanceOfRain
                    weather.dailyForecast.forecast.forEach {
                        self.tenDaysChancesOfRain.append(daysChanceOfRain(day: self.dayFormatter(date: $0.date), value: "\($0.precipitationChance.formatted(.percent))"))
                    }

                    
                }
            } catch {
                print("Error fetching data:", error)
            }
        }
    }
    
    func hourFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        
        let calendar = Calendar.current
        
        let inputDateComponents = calendar.dateComponents([.day, .hour], from: date)
        let currentDateComponents = calendar.dateComponents([.day, .hour], from: Date())
        
        if inputDateComponents == currentDateComponents {
            return "Now"
        } else {
            return dateFormatter.string(from: date)
        }
    }
    
    
    func isSameHourOrLater(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        let comparisonResult = calendar.compare(date1, to: date2, toGranularity: .hour)
        
        return comparisonResult == .orderedSame || comparisonResult == .orderedDescending
        
    }
    
    func dayFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        
        let calendar = Calendar.current
        
        let inputDateComponents = calendar.dateComponents([.day], from: date)
        let currentDateComponents = calendar.dateComponents([.day], from: Date())
        
        if inputDateComponents == currentDateComponents {
            return "Now"
        } else {
            return dateFormatter.string(from: date)
        }
    }
    
}


struct HourWeatherData {
    let time: String
    let symbolName: String
    let temperature: String
}


struct DayWeather: Hashable {
    let day: String
    let symbolName: String
    let lowTemperature: String
    let highTemperature: String
}


struct MoonEvents: Hashable{
    let day: String
    let symbolName: String
    let moonRise: String
    let moonSet: String
}


struct SunEvents: Hashable {
    let day: String
    let sunRise: String
    let sunSet: String
}


struct PressureDetails: Hashable {
    
    let hour: String
    let value: String
    
    
}

struct HourUVIndex: Hashable {
    
    let hour: String
    let value: String
    
}


struct daysChanceOfRain : Hashable {
    
    
    let day: String
    let value: String
    
}
