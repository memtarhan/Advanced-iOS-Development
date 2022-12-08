//
//  ViewController.swift
//  Images
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
        let imageView = createImageView(named: "cat")
        let label = createLabel(withText: "Title")
        let button = createButton(withTitle: "Get Started")

        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(button)

//        imageView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor).isActive = true

        imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true

        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true

        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 300).isActive = true
        button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true

//        label.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor).isActive = true
    }

    private func createImageView(named: String) -> UIImageView {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: named)

        imageView.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority(749), for: .vertical)

        return imageView
    }

    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 32)
        label.backgroundColor = .systemMint

        return label
    }

    private func createButton(withTitle title: String) -> UIButton {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue

        return button
    }
}
