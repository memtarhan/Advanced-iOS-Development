//
//  LabelWithSwitch.swift
//  StackViews
//
//  Created by Mehmet Tarhan on 15/12/2022.
//

import UIKit

class LabelWithSwitchView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Title"

        return label
    }()

    private lazy var onOffSwitch: UISwitch = {
        let onOffSwitch = UISwitch()
        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false

        return onOffSwitch
    }()

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var isOn: Bool? {
        didSet {
            onOffSwitch.isOn = isOn ?? false
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .systemOrange

        addSubview(titleLabel)
        addSubview(onOffSwitch)

        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

        onOffSwitch.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        onOffSwitch.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 32)
    }
}
