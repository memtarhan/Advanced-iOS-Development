//
//  ColorSliderView.swift
//  NewUI
//
//  Created by Mehmet Tarhan on 27.05.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import SwiftUI

struct ColorSliderView: View {
    var color: Color
    @Binding var colorValue: Double
    
    var body: some View {
        HStack {
            ColorSwatch(color: color)
            Slider(value: $colorValue, in: 0 ... 1, step: 0.01)
                .accentColor(color)
        }
        .padding()
    }
}
