//
//  WeatherInfo.swift
//  StaticLists
//
//  Created by Alec Meyer on 1/17/22.
//

import Foundation

struct WeatherInfo: Identifiable {
    var id = UUID()
    var image: String
    var temp: Int
    var city: String
}


