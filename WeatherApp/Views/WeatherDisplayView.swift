//
//  WeatherDisplayView.swift
//  WeatherApp
//
//  Created by Rob on 7/29/20.
//

import SwiftUI

struct WeatherDisplayView: View {
    var body: some View {
        VStack {
            Image("rain")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("New York City")
                .font(.title)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            Text("32")
                .font(.title)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct WeatherDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDisplayView()
    }
}
