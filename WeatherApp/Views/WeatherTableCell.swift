//
//  WeatherTableCell.swift
//  WeatherApp
//
//  Created by Rob on 7/29/20.
//

import SwiftUI

struct WeatherTableCell: View {
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Image("rain")
                .resizable()
                .frame(width: 50, height: 50)
            Text("New York City")
            Text("75")
            Spacer()
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
}

struct WeatherTableCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherTableCell()
            WeatherTableCell()
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
