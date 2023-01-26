//
//  PlaybackViewController.swift
//  ScrollableViewController
//
//  Created by Mehmet Tarhan on 08/12/2022.
//

import UIKit

class PlaybackViewController: ScrollableViewController {
    private let info = ["Offline", "Gapless Playback", "Hide Unplayable Songs", "Enable Audio Normalization"]

    private lazy var labels: [UILabel] = {
        let labels = (0 ..< info.count).map { index in
            let label = UILabel()
            label.text = info[index]
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        return labels
    }()

    private lazy var switches: [UISwitch] = {
        let switches = (0 ..< info.count).map { _ in
            let swi = UISwitch()
            swi.translatesAutoresizingMaskIntoConstraints = false
            return swi
        }

        return switches
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Playback"

        setupViews()
    }

    private func setupViews() {
        zip(labels, switches).map { label, swi in
            let view = UIView()
            view.addSubview(label)
            view.addSubview(swi)

            swi.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
            swi.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

            return view
        }.forEach { subview in
            self.addSubview(subview)

            subview.heightAnchor.constraint(equalToConstant: 64).isActive = true 
        }
    }
}
