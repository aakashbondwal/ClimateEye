//
//  WeatherIconExtensions.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 30/10/23.
//

import SwiftUI
import WeatherKit
import SpriteKit

extension WeatherCondition {
    var conditionImage: String {
        switch self {
        case .blizzard:
            "Wind"
        case .blowingDust:
            "Wind"
        case .blowingSnow:
            "Windy Snow"
        case .breezy:
            "Day Cloud With Wind"
        case .clear:
            "Sun"
        case .cloudy:
            "Cloudy Sunny Clouds"
        case .drizzle:
            "Day Partly Cloudy With Rain"
        case .flurries:
            "Day Snowing Cloud"
        case .foggy:
            "Day Windy"
        case .freezingDrizzle:
            "Day Windy Angled Rain Cloud"
        case .freezingRain:
            "Day Clouds With Snow"
        case .frigid:
            "Day Clouds With Snow"
        case .hail:
            "Day Clouds With Snow"
        case .haze:
            "Day Partly Cloudy With Wind"
        case .heavyRain:
            "Day Windy Angled Rain Drops With Lightning"
        case .heavySnow:
            "Day Clouds With Snow"
        case .hot:
            "Sun"
        case .hurricane:
            "Tornado"
        case .isolatedThunderstorms:
            "Day Windy Angled Rain Drops With Lightning"
        case .mostlyClear:
            "Sun"
        case .mostlyCloudy:
            "Day Partly Cloudy"
        case .partlyCloudy:
            "Day Partly Cloudy With Wind"
        case .rain:
            "Day Angled Rainy"
        case .scatteredThunderstorms:
            "Day Cloud With Lightning 1"
        case .sleet:
            "Day Clouds With Snow"
        case .smoky:
            "Day Windy"
        case .snow:
            "Day Clouds With Snow"
        case .strongStorms:
            "Day Cloud With Lightning 1"
        case .sunFlurries:
            "Day Partly Cloudy"
        case .sunShowers:
            "Day Partly Cloudy With Rain Drops"
        case .thunderstorms:
            "Day Cloud With Lighning 1"
        case .tropicalStorm:
            "Tornado"
        case .windy:
            "Wind"
        case .wintryMix:
            "Day Partly Cloudy With Wind"
        @unknown default:
            "Sun"
        }
    }
    
    var nightConditionImage : String {
        switch self {
            
        case .blizzard:
            "Wind"
        case .blowingDust:
            "Wind"
        case .blowingSnow:
            "Windy Snow"
        case .breezy:
            "Night Cloud With Wind"
        case .clear:
            "Moon"
        case .cloudy:
            "Night Cloudy"
        case .drizzle:
            "Night Partly Cloudy With Angled Rain"
        case .flurries:
            "Night Snowing Cloud"
        case .foggy:
            "Moon With Wind"
        case .freezingDrizzle:
            "Night Windy Angled Rain Cloud"
        case .freezingRain:
            "Night Clouds With Snow"
        case .frigid:
            "Night Clouds With Snow"
        case .hail:
            "Night Clouds With Snow"
        case .haze:
            "Night Partly Cloudy With Rain Drops"
        case .heavyRain:
            "Night Rainy"
        case .heavySnow:
            "Night Clouds With Snow"
        case .hot:
            "Moon"
        case .hurricane:
            "Tornado"
        case .isolatedThunderstorms:
            "Night Windy Angled Rain Drops With Lightning"
        case .mostlyClear:
            "Moon"
        case .mostlyCloudy:
            "Night Cloudy"
        case .partlyCloudy:
            "Night Partly Cloudy"
        case .rain:
            "Night Rainy"
        case .scatteredThunderstorms:
            "Night Cloud With Lightning"
        case .sleet:
            "Night Clouds With Snow"
        case .smoky:
            "Moon With Wind"
        case .snow:
            "Night Snowing Cloud"
        case .strongStorms:
            "Night Cloud With Lightning"
        case .sunFlurries:
            "Night Partly  Cloudy"
        case .sunShowers:
            "Night Partly Cloudy With Rain Drops"
        case .thunderstorms:
            "Night Cloud With Lighning"
        case .tropicalStorm:
            "Tornado"
        case .windy:
            "Wind"
        case .wintryMix:
            "Night Partly Cloudy"
        @unknown default:
            "Moon"
        }
    }

}

