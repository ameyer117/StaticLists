//
//  ContentView.swift
//  StaticLists
//
//  Created by Alec Meyer on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText=""
    @State var weatherData: [WeatherInfo] = [
        WeatherInfo(image: "snow", temp: 5, city:"Manitowoc"),
        WeatherInfo(image: "cloud", temp:5, city:"Kansas City"),
        WeatherInfo(image: "sun.max", temp: 80, city:"San Francisco"),
        WeatherInfo(image: "snow", temp: 5, city:"Chicago"),
        WeatherInfo(image: "cloud.rain", temp: 49, city:"Washington DC"),
        WeatherInfo(image: "cloud.heavyrain", temp: 60, city:"Seattle"),
        WeatherInfo(image: "sun.min", temp: 75, city:"Baltimore"),
        WeatherInfo(image: "sun.dust", temp: 65, city:"Austin"),
        WeatherInfo(image: "sunset", temp: 78, city:"Houston"),
        WeatherInfo(image: "moon", temp: 80, city:"Boston"),
        WeatherInfo(image: "moon.circle", temp: 45, city:"Denver"),
        WeatherInfo(image: "cloud.snow", temp: 8, city:"Philadelphia"),
        WeatherInfo(image: "cloud.hail", temp: 5, city:"Memphis"),
        WeatherInfo(image: "cloud.sleet", temp:5, city:"Nashville"),
        WeatherInfo(image: "sun.max", temp: 80, city:"San Francisco"),
        WeatherInfo(image: "cloud.sun", temp: 5, city:"Atlanta"),
        WeatherInfo(image: "wind", temp: 88, city:"Las Vegas"),
        WeatherInfo(image: "cloud.rain", temp: 60, city:"Phoenix"),
        ]
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults) { weather in
                    WeatherRow(weather: weather)
                }.onDelete(perform: self.deleteRow)
                    .onMove(perform: self.moveRow)
            }.listStyle(.plain)
            .searchable(text: $searchText)
            .navigationTitle("Weather")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Add") {
                            addItemToRow()
                        }
                        EditButton()
                    }
                }
        }
    }
    
    var searchResults: [WeatherInfo] {
        if searchText.isEmpty {
            return weatherData
        }
        
        let searchTextLower = searchText.lowercased()
        return weatherData.filter {
            $0.city.lowercased().contains(searchTextLower)
        }
    }
    
    private func addItemToRow() {
        self.weatherData.append(WeatherInfo(image: "cloud.sun", temp: Int.random(in: 0..<105), city: randomString(length: 8) ))
    }
    
    private func deleteRow(indexSet: IndexSet) {
        self.weatherData.remove(atOffsets: indexSet)
    }
    
    private func moveRow(indexSet: IndexSet, destination: Int) {
        self.weatherData.move(fromOffsets: indexSet, toOffset: destination)
    }
    
    private func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
