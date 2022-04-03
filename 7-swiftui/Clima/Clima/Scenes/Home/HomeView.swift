//
//  HomeView.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var city: String = "Aveiro"
    @State private var temperature: String = "15°"
    @State private var condition: String = "Partly Cloudy"
    @State private var highTemperature: String = "H:17°"
    @State private var lowTemperature: String = "L:7°"

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Spacer()

                VStack(alignment: .center, spacing: 4) {
                    Text(city)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Text(temperature)
                        .font(.system(size: 64, weight: .light, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Text(condition)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    HStack(alignment: .center, spacing: 4) {
                        Text(highTemperature)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Text(lowTemperature)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }

                Spacer()

            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("BackgroundImage").resizable().aspectRatio(contentMode: .fill))
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
