//
//  DetailView.swift
//  NewUI
//
//  Created by Mehmet Tarhan on 27.05.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var data: TableData?
    
    var body: some View {
        VStack {
            Text(data?.title ?? "")
                .font(.largeTitle)
            Text(data?.detail ?? "")
                .font(.headline)
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(data: DataModel.data[1])
    }
}
