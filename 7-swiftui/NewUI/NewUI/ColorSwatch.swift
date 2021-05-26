//
//  ColorSwatch.swift
//  NewUI
//
//  Created by Mehmet Tarhan on 27.05.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import SwiftUI

struct ColorSwatch: View {
    var color: Color

    var body: some View {
        Circle()
            .frame(width: 20, height: 20, alignment: .center)
            .foregroundColor(color)
    }
}

struct ColorSwatch_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatch(color: .red)
    }
}
