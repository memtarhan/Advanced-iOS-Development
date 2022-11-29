//
//  CardView.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import SwiftUI

struct Card {
    let prompt: String
    let answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}

struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)

            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)

                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}
