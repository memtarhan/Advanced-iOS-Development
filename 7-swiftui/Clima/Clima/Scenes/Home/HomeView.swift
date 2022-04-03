//
//  HomeView.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    @ObservedObject private var locationViewModel = LocationViewModel()

    let locationManager = CLLocationManager()

    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .center, spacing: 4) {
                        Text(locationViewModel.location?.description ?? "CLLocation")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Text(viewModel.temperature)
                            .font(.system(size: 64, weight: .light, design: .default))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Text(viewModel.condition)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        HStack(alignment: .center, spacing: 4) {
                            Text(viewModel.highTemperature)
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                            Text(viewModel.lowTemperature)
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        }
                    }

                    Spacer()

                    VStack {
                        HStack(alignment: .center, spacing: 20) {
                            InfoCardView(viewModel: viewModel, title: "Feels like", type: .feelsLike)
                            InfoCardView(viewModel: viewModel, title: "Humidity", type: .humidity)
                        }

                        HStack(alignment: .center, spacing: 20) {
                            InfoCardView(viewModel: viewModel, title: "Feels like", type: .feelsLike)
                            InfoCardView(viewModel: viewModel, title: "Humidity", type: .humidity)
                        }

                        HStack(alignment: .center, spacing: 20) {
                            InfoCardView(viewModel: viewModel, title: "Feels like", type: .feelsLike)
                            InfoCardView(viewModel: viewModel, title: "Humidity", type: .humidity)
                        }

                        HStack(alignment: .center, spacing: 20) {
                            InfoCardView(viewModel: viewModel, title: "Feels like", type: .feelsLike)
                            InfoCardView(viewModel: viewModel, title: "Humidity", type: .humidity)
                        }

                        HStack(alignment: .center, spacing: 20) {
                            InfoCardView(viewModel: viewModel, title: "Feels like", type: .feelsLike)
                            InfoCardView(viewModel: viewModel, title: "Humidity", type: .humidity)
                        }

                        HStack(alignment: .center, spacing: 20) {
                            InfoCardView(viewModel: viewModel, title: "Feels like", type: .feelsLike)
                            InfoCardView(viewModel: viewModel, title: "Humidity", type: .humidity)
                        }

                    }.padding()

                }.padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("BackgroundImage").resizable().aspectRatio(contentMode: .fill))
        .ignoresSafeArea()
        .onAppear {
            self.viewModel.fetch()

            self.locationViewModel.trigger()
        }
    }
}

struct InfoCardView: View {
    @ObservedObject var viewModel: HomeViewModel

    @State var title: String = ""
    @State var type: CardType

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.black.opacity(0.3))
                .shadow(radius: 10)
                .aspectRatio(contentMode: .fit)

            VStack {
                Text(title)
                    .font(.title3)
                    .foregroundColor(.white)

                switch type {
                case .feelsLike:
                    Text(viewModel.feelsLike)
                        .font(.body)
                        .foregroundColor(.white)

                case .humidity:
                    Text(viewModel.humidity)
                        .font(.body)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .multilineTextAlignment(.center)
        }
//        .frame(width: 128, height: 128)
    }
}

enum CardType {
    case feelsLike
    case humidity
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
