//
//  ViewController.swift
//  AnchorsLab
//
//  Created by Mehmet Tarhan on 07/12/2022.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        let upperLeftLabel = createLabel(withText: "upperLeft")
        view.addSubview(upperLeftLabel)

        upperLeftLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        upperLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
    }

    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .systemMint

        return label
    }
}
