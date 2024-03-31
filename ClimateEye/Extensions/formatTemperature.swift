//
//  formatTemperature.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//

import Foundation
import WeatherKit

func formatTemperature(_ temperature: Measurement<UnitTemperature>) -> String {
    let celsiusValue = temperature.converted(to: .celsius).value
    let formattedTemperature = String(format: "%.0f", celsiusValue)
    return "\(formattedTemperature)°C"
}

