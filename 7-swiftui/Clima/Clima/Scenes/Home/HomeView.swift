//
//  HomeView.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import CoreLocation
import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()

    var body: some View {
        ZStack(alignment: .center) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .center, spacing: 4) {
                        Text(viewModel.city)
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
//                        HStack(alignment: .center, spacing: 4) {
//                            Text(viewModel.highTemperature)
//                                .font(.title3)
//                                .fontWeight(.medium)
//                                .foregroundColor(Color.white)
//                                .multilineTextAlignment(.center)
//                            Text(viewModel.lowTemperature)
//                                .font(.title3)
//                                .fontWeight(.medium)
//                                .foregroundColor(Color.white)
//                                .multilineTextAlignment(.center)
//                        }
                    }

                    Spacer()

                    if viewModel.shouldShowHourly {
                        ZStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(alignment: .center, spacing: 8) {
                                    ForEach(0 ..< viewModel.hourly.count, id: \.self) { index in
                                        VStack {
                                            Text("\(viewModel.hourly[index].time)")
                                                .foregroundColor(.white)
                                            AsyncImage(url: URL(string: "https://openweathermap.org/img/w/\(viewModel.hourly[index].icon).png"))
                                            Text("\(viewModel.hourly[index].temp)")
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 128)
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(25)
                        .shadow(radius: 10)
                        .aspectRatio(contentMode: .fit)
                    }

                    Spacer()

                    VStack {
                        HStack(alignment: .center, spacing: 20) {
                            InfoCardView(viewModel: viewModel, title: "Feels like", type: .feelsLike)
                            SunRiseAndSetView(viewModel: viewModel)
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
            .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("BackgroundImage").resizable().aspectRatio(contentMode: .fill))
        .ignoresSafeArea()
        .onAppear {
            self.viewModel.trigger()
        }
    }
}

struct SunRiseAndSetView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.black.opacity(0.3))
                .shadow(radius: 10)
                .aspectRatio(contentMode: .fit)

            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Image(systemName: "sunrise.fill")
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                        Text("SUNRISE")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    Text(viewModel.sunrise)
                        .font(.body)
                        .foregroundColor(.white)
                }
                Divider()
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Image(systemName: "sunset.fill")
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                        Text("SUNSET")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    Text(viewModel.sunset)
                        .font(.body)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .multilineTextAlignment(.center)
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
    }
}

enum CardType {
    case feelsLike
    case humidity
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
