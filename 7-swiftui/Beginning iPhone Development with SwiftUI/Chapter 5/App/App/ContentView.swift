//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 11/03/2022.
//

import SwiftUI

// MARK: Displaying Shapes

/*
 Capsule

 Circle

 Ellipse

 Rectangle

 RoundedRectangle(cornerRadius: x)
 */
// struct ContentView: View {
//    var body: some View {
//        VStack(spacing: 16) {
//            Capsule(style: .continuous)
//            Circle()
//            Ellipse()
//            Rectangle()
//            RoundedRectangle(cornerRadius: 30)
//                .fill(Color.yellow)
//
//        }.padding()
//    }
// }

// MARK: - Coloring a Shape with Gradients

// struct ContentView: View {
//    var body: some View {
//        VStack(spacing: 64) {
//            Capsule()
//                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .green, .pink]),
//                                     startPoint: .topLeading,
//                                     endPoint: .bottomTrailing))
//
//            /*
//             The size of the first color is defined by the startRadius. The smaller the startRadius value, the smaller the radius of the first color. The larger the endRadius value is compared to the startRadius value, the more diffuse the colors will blend together. The smaller the endRadius value is compared to the startRadius, the sharper the boundaries between colors
//             */
//            Ellipse()
//                .fill(RadialGradient(gradient: Gradient(colors: [.blue, .yellow]),
//                                     center: .center,
//                                     startRadius: 10,
//                                     endRadius: 75))
//
//            Rectangle()
//                .fill(AngularGradient(gradient: Gradient(colors: [.green, .blue]),
//                                      center: .center))
//
//            Rectangle()
//                .fill(AngularGradient(gradient: Gradient(colors: [.green, .blue, .black, .green, .blue, .black, .green]),
//                                      center: .center))
//        }.padding()
//    }
// }

// MARK: - Displaying Images

struct ContentView: View {
    var body: some View {
        VStack(spacing: 64) {
            HStack(spacing: 16) {
                Image(systemName: "tortoise.fill")
                    .opacity(0.33)
                Image(systemName: "tortoise.fill")
                    .font(.largeTitle)
                    .opacity(0.66)
                Image(systemName: "tortoise.fill")
                    .font(.custom("", size: 46))
            }

            HStack {
                Image(systemName: "tortoise.fill")
                    .font(.largeTitle)
                    .frame(width: 150, height: 150)
                    .aspectRatio(0.5, contentMode: .fill)
            }

        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
