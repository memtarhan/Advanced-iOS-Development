//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 10/03/2022.
//

import SwiftUI

// MARK: - Using the Padding Modifier

// struct ContentView: View {
//    var body: some View {
//        VStack {
//            VStack {
//                Text("Default padding of 16 points")
//                    .padding()
//                    .background(Color.yellow)
//                Text("Padding of 45 points")
//                    .padding(45)
//                    .background(Color.yellow)
//                Text("Padding of 3 points")
//                    .padding(3)
//                    .background(Color.yellow)
//            }
//            VStack {
//                /*
//                 .top
//
//                 .bottom
//
//                 .vertical (top and bottom)
//
//                 .leading (left)
//
//                 .trailing (right)
//
//                 .horizontal (trailing and leading)
//                 */
//
//                Text("Top padding only")
//                    .padding(.top)
//                    .background(Color.yellow)
//                Text("Bottom padding only")
//                    .padding(.bottom)
//                    .background(Color.yellow)
//                Text("Vertical padding")
//                    .padding(.vertical)
//                    .background(Color.yellow)
//
//                Text("Top and leading")
//                    .padding([.top, .leading], 30)
//                    .background(Color.yellow)
//
//                Text("Trailing with custom parameter")
//                    .padding(.trailing, 30)
//                    .background(Color.yellow)
//
//            }.padding()
//        }.padding()
//    }
// }

// MARK: - Defining Spacing Within a Stack

//       - Aligning Views Within a Stack

// struct ContentView: View {
//    var body: some View {
//        VStack {
//            // No padding
////        VStack {
////            Text("Top Text view")
////                .background(Color.yellow)
////            Text("Middle Text view")
////                .background(Color.yellow)
////            Text("Bottom Text view")
////                .background(Color.yellow)
////        }
//
//            // With padding
//            VStack {
//                Text("Top Text view")
//                    .padding()
//                    .background(Color.yellow)
//                Text("Middle Text view")
//                    .padding()
//                    .background(Color.yellow)
//                Text("Bottom Text view")
//                    .padding()
//                    .background(Color.yellow)
//            }
//
//            // With Spacing & alignment
//            /*
//             .leading (left)
//
//             .center (default setting if no other alignment options are chosen)
//
//             .trailing (right)
//             */
//
//            VStack(alignment: .leading, spacing: 40) {
//                Text("Top Text view")
//                    .background(Color.yellow)
//                Text("Middle Text view")
//                    .background(Color.yellow)
//                Text("Bottom Text view")
//                    .background(Color.yellow)
//            }
//        }
//    }
// }

// MARK: - Using Spacers

// - A spacer acts like a spring that pushes two views as far apart as possible
/*
 Spacers automatically adjust their size based on screen size. However, you may want to define a minimum length for a spacer to keep it from shrinking too far. To define a minimum length, use the following code:
 Spacer(minLength: 25.73)
 Notice that you can define the minimum length as a decimal value (CGFloat) although you could use an integer value as well such as
 Spacer(minLength: 25)
 If you do not specify a minimum length, the spacer will simply grow or shrink based on the screen size that the app is running in.
 */

// struct ContentView: View {
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Left")
//                    .font(.system(size: 40))
//                    .background(Color.yellow)
//                Spacer()
//                Text("Right")
//                    .font(.system(size: 40))
//                    .background(Color.yellow)
//            }.padding()
//
//            Spacer()
//
//            VStack {
//                Text("Top")
//                    .font(.title)
//                    .background(Color.yellow)
//                Spacer()
//                Text("Middle")
//                    .font(.title)
//                    .background(Color.yellow)
//                Spacer()
//                Text("Bottom")
//                    .font(.title)
//                    .background(Color.yellow)
//            }.padding()
//        }.padding()
//    }
// }

// MARK: - Using the Offset and Position Modifiers

struct ContentView: View {
    var body: some View {
        ZStack {
            Text("Top")
                .font(.title)
                .background(Color.red)
            Text("Top")
                .font(.title)
                .background(Color.green)
                .offset(x: 75, y: 125)
            /*
             Positive x values move a view to the right, and negative x values move a view to the left. Likewise, positive y values move a view down, and negative values move a view up
             */
            Text("Top")
                .font(.title)
                .background(Color.blue)
                .offset(x: -75, y: -125)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
