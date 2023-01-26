//
//  ScrollableViewController.swift
//  StackViews
//
//  Created by Mehmet Tarhan on 15/12/2022.
//

import UIKit

class ScrollableViewController: UIViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        let stackView = createStackView(withOrientation: .vertical)
//        stackView.distribution = .fill
//        stackView.alignment = .fill
        let scrollView = createScrollView()

        scrollView.addSubview(stackView)
        view.addSubview(scrollView)

        for index in 1 ... 40 {
            let row = LabelWithSwitchView()
            row.title = "Index #\(index)"
            row.isOn = index % 4 == 0
            stackView.addArrangedSubview(row)
            row.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true 
        }

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),

        ])
    }
}
