//
//  ViewController.swift
//  ContentSizeLab
//
//  Created by Mehmet Tarhan on 08/12/2022.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        let label1 = createLabel(withText: "label1")
        view.addSubview(label1)

        label1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
    }

    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .boldSystemFont(ofSize: 32)
        label.backgroundColor = .systemMint

        return label
    }
}
