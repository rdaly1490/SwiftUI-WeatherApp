//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Rob on 7/28/20.
//

import SwiftUI

struct WeatherView: View {
    
    init() {
        self.weatherViewModel = WeatherViewModel()
    }
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    @State private var isSearching = false
    
    var body: some View {
            
        VStack {
            TextField("Enter city name", text: self.$weatherViewModel.cityName) {
                self.isSearching = true
                self.weatherViewModel.search {
                    self.isSearching = false
                }
            }
            .font(.custom("Arial", size: 18))
            .padding()
            .multilineTextAlignment(.center)
            
            if self.isSearching {
                ActivityIndicator()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.orange)
            } else {
                WeatherDisplayView()
            }
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding()
        .background(Color(.gray).opacity(0.2))
        .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
