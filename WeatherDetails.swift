//
//  WeatherDetails.swift
//  Weather
//
//  Created by Michał Krzysteczko on 20/04/2023.
//

import SwiftUI

struct WeatherDetails: View {
    
    @ObservedObject var wd:WeatherData
    
    init(city:City)
    {
        wd = WeatherData(city: city)
    }
    
    var body: some View {
        VStack
        {
            Image(wd.weather)
                .frame(maxWidth: 250.0, maxHeight: 250.0)
                .clipShape(Circle())
                .padding()
                .shadow(radius: 40.0)
            
            HStack
            {
                Text("Pogoda")
                Spacer()
                Text("\(wd.weather)")
            }
            .padding()
            
            HStack
            {
                Text("Temperatura")
                Spacer()
                let convert = (wd.temperature - 273.15)
                Text("\(convert, specifier: "%.2f") °C")
            }
            .padding()
            
            HStack
            {
                Text("Wilgotność")
                Spacer()
                Text("\(wd.humidity) %")
            }
            .padding()
            
            HStack
            {
                Text("Ciśnienie")
                Spacer()
                Text("\(wd.pressure) hPa")
            }
            .padding()
        }
        .navigationBarTitle(wd.city.displayName)
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetails(city: City(id: 1, name: "Warszawa", country: "pl", displayName: "Warszawa, Polska"))
    }
}
