//
//  ContentView.swift
//  Weather
//
//  Created by Michał Krzysteczko on 20/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    var cities: [City] = [
        City(id: 1, name: "Torun", country: "pl", displayName: "Toruń, Polska"),
        City(id: 2, name: "Warszawa", country: "pl", displayName: "Warszawa, Polska"),
        City(id: 3, name: "London", country: "uk", displayName: "Londyn, Wielka Brytania")
    ]
        
    var body: some View {
        NavigationView{
            List{
                ForEach(self.cities){
                    city in
                    NavigationLink(destination:WeatherDetails(city: city)){
                        RowView(city: city)
                    }
                }
            }
            .navigationBarTitle("Miasta")
        }
    }
}
struct RowView:View
{
    var city: City
    var body: some View
    {
        HStack
        {
            Image(systemName: "globe")
            VStack(alignment: .leading)
            {
                Text(city.displayName)
                    .bold()
                Text("\(city.id) \(city.country)")
                    .font(.subheadline)
            }
        }
        .preferredColorScheme(.light)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
