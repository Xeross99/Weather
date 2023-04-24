//
//  WeatherData.swift
//  Weather
//
//  Created by Michał Krzysteczko on 24/04/2023.
//

import Foundation
import SwiftUI

class WeatherData: ObservableObject{
    @Published var weather = "Rain"
    @Published var temperature = 22.0
    @Published var humidity = 66
    @Published var pressure = 1000
    @Published var city:City
    
    init(city: City)
    {
        self.city = city
        self.refreshData()
    }
    
    func refreshData()
    {
        let address = "https://api.openweathermap.org/data/2.5/weather?q=\(city.name),\(city.country)&APPID=f03fe9e178aa6b425bf2b283090d39bc"
        if let url = URL(string:address)
        {
            let data = try! Data(contentsOf: url)
            let jsd = JSONDecoder()
            let response = try! jsd.decode(Response.self, from: data)
            
            self.weather = response.weather?.first?.main ?? "Clouds"
            self.temperature = response.main?.temp ?? 0.0
            self.humidity = response.main?.humidity ?? 0
            self.pressure = response.main?.pressure ?? 0
        }
    }
}

struct Main:Codable
{
    var temp:Double?
    var pressure:Int?
    var humidity:Int?
}

struct Weather:Codable
{
    var main:String?
}

struct Response:Codable
{
    var weather:[Weather]?
    var main:Main?
}
