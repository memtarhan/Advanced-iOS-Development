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

            }.padding(EdgeInsets(top: 64, leading: 32, bottom: 20, trailing: 32))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("BackgroundImage").resizable().aspectRatio(contentMode: .fill))
        .ignoresSafeArea()
        .onAppear {
            self.viewModel.fetch()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
