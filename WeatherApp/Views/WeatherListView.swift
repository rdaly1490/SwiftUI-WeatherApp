//
//  WeatherListView.swift
//  WeatherApp
//
//  Created by Rob on 7/29/20.
//

import SwiftUI

struct WeatherData: Identifiable {
    let id = UUID()
}

var weatherData = [WeatherData(), WeatherData()]

struct WeatherListView: View {
    
    private func delete(offset: IndexSet) {
        for index in offset {
            weatherData.remove(at: index)
        }
        
    }
    
    private func move(indices: IndexSet, newOffset: Int) {
        
    }
    
    var body: some View {
        VStack(spacing: 0) {
            WeatherDisplayView()
            List {
                ForEach(weatherData) { weather in
                    WeatherTableCell()
                }
                .onDelete(perform: self.delete)
                .onMove(perform: self.move)
            }
            
        }
    }
}

struct WeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
