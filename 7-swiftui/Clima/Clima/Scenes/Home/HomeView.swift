//
//  HomeView.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            ScrollView {
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
                        HStack {
                            InfoCardView(viewModel: viewModel, title: "Feels like", type: .feelsLike)
                            InfoCardView(viewModel: viewModel, title: "Humidity", type: .humidity)

                        }

                    }.padding()

                }.padding(32)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("BackgroundImage").resizable().aspectRatio(contentMode: .fill))
        .ignoresSafeArea()
        .onAppear {
            self.viewModel.fetch()
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

            VStack {
                Text(title)
                    .font(.title3)
                    .foregroundColor(.white)

                Text(type == .feelsLike ? viewModel.feelsLike : viewModel.humidity)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 128, height: 128)
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