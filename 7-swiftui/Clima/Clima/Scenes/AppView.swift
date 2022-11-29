//
//  AppView.swift
//  Clima
//
//  Created by Mehmet Tarhan on 04/04/2022.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            HomeView()
            HomeView()
            HomeView()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
