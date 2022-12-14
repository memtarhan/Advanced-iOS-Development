//
//  Helpers.swift
//  StackViews
//
//  Created by Mehmet Tarhan on 14/12/2022.
//

import UIKit

func createLabel(withText text: String, size: CGFloat, color: UIColor) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textAlignment = .center
    label.font = .systemFont(ofSize: size, weight: .semibold)
    label.textColor = .black
    label.backgroundColor = color

    return label
}

func createStackView(withOrientation orientation: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 4
    
    return stackView
}
