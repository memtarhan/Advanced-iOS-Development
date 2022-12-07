//
//  ViewController.swift
//  SafeAreaLab
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
        let topLabel = createLabel(withText: "top")
        view.addSubview(topLabel)

        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let bottomLabel = createLabel(withText: "bottom")
        view.addSubview(bottomLabel)
        
        bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
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
