//
//  CHCRFillViewController.swift
//  StackViews
//
//  Created by Mehmet Tarhan on 14/12/2022.
//

import UIKit

class CHCRFillViewController: UIViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        navigationItem.title = "CHCR Fill"

        let stackView = createStackView(withOrientation: .vertical)
        stackView.distribution = .fill

        view.addSubview(stackView)

        let bigLabel = createLabel(withText: "Big", size: 128, color: .systemYellow)
        let mediumLabel = createLabel(withText: "Med", size: 64, color: .systemOrange)
        let smallLabel = createLabel(withText: "Sml", size: 32, color: .systemGreen)

        mediumLabel.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
        
        stackView.addArrangedSubview(bigLabel)
        stackView.addArrangedSubview(mediumLabel)
        stackView.addArrangedSubview(smallLabel)

        stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
}
