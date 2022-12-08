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
        let nameLabel = createLabel(withText: "Name")
        view.addSubview(nameLabel)

        nameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let nameTextField = createTextField(withPlaceholder: "Your name")
        view.addSubview(nameTextField)
        
        nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        nameTextField.firstBaselineAnchor.constraint(equalTo: nameLabel.firstBaselineAnchor).isActive = true
        
        
    }

    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .systemMint

        return label
    }

    private func createTextField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.backgroundColor = .systemGray4

        return textField
    }
}
