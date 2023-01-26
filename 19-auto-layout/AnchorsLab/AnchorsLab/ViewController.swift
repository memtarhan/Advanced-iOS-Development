//
//  ViewController.swift
//  AnchorsLab
//
//  Created by Mehmet Tarhan on 07/12/2022.
//

import UIKit

class ViewController: UIViewController {
    private var safeAreaLayoutGuide: UILayoutGuide { view.safeAreaLayoutGuide }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        let leftLabel = createLabel(withText: "left")
        leftLabel.backgroundColor = .systemMint
        view.addSubview(leftLabel)

        let rightLabel = createSecondaryLabel(withText: "right")
        rightLabel.backgroundColor = .yellow
        view.addSubview(rightLabel)

        leftLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        leftLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true

//        rightLabel.topAnchor.constraint(equalTo: leftLabel.topAnchor).isActive = true
//        rightLabel.centerYAnchor.constraint(equalTo: leftLabel.centerYAnchor).isActive = true
        rightLabel.firstBaselineAnchor.constraint(equalTo: leftLabel.firstBaselineAnchor).isActive = true
        rightLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor, constant: 8).isActive = true
    }

//    private func setupViews() {
//        let upperLeftLabel = createLabel(withText: "upperLeft")
//        view.addSubview(upperLeftLabel)
//
//        upperLeftLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        upperLeftLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//
//        let upperRightLabel = createLabel(withText: "upperRight")
//        view.addSubview(upperRightLabel)
//
//        upperRightLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        upperRightLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//
//        let lowerLeftLabel = createSecondaryLabel(withText: "lowerLeft")
//        view.addSubview(lowerLeftLabel)
//
//        lowerLeftLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
//        lowerLeftLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//
//        let button = createButton(withTitle: "Play")
//        view.addSubview(button)
//
//        button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
//        button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//
//        let centerView = createView(withColor: .systemPurple)
//        view.addSubview(centerView)
//
//        // MARK: Option #1
//
    ////        centerView.topAnchor.constraint(equalTo: upperRightLabel.bottomAnchor, constant: 32).isActive = true
    ////        centerView.bottomAnchor.constraint(equalTo: lowerLeftLabel.topAnchor, constant: -32).isActive = true
    ////        centerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    ////        centerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
//
//        // MARK: Option #2
//
//        centerView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
//        centerView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
//        centerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
//        centerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
//    }

    private func createView(withColor color: UIColor) -> UIView {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        view.layer.cornerRadius = 12

        return view
    }

    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text

        return label
    }

    private func createSecondaryLabel(withText text: String) -> UILabel {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 15)

        return label
    }

    private func createButton(withTitle title: String) -> UIButton {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12

        return button
    }
}
