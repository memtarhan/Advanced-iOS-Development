//
//  PlaybackViewController.swift
//  SpotifyLab
//
//  Created by Mehmet Tarhan on 14/12/2022.
//

import UIKit

class PlaybackViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.distribution = .fill

        return stackView
    }()

    override func loadView() {
        super.loadView()

        view = UIView()
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
        let offlineView = LabelWithSwitchView()
        offlineView.title = "Offline"
        offlineView.isOn = true 
        stackView.addArrangedSubview(offlineView)
        
        let gaplessView = LabelWithSwitchView()
        offlineView.title = "Gapless Playback"
        offlineView.isOn = false
        stackView.addArrangedSubview(gaplessView)
        
        stackView.addArrangedSubview(offlineView)
        stackView.addArrangedSubview(gaplessView)

    }
}
