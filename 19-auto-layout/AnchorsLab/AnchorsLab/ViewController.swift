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
        let upperLeftLabel = createLabel(withText: "upperLeft")
        view.addSubview(upperLeftLabel)

        upperLeftLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        upperLeftLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true

        let upperRightLabel = createLabel(withText: "upperRight")
        view.addSubview(upperRightLabel)

        upperRightLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        upperRightLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }

    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .systemMint

        return label
    }
}
