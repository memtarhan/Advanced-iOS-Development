//
//  PreviewViewController.swift
//  SpotifyLab
//
//  Created by Mehmet Tarhan on 08/12/2022.
//

import UIKit

class PreviewViewController: UIViewController {
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        imageView.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
        imageView.setContentHuggingPriority(UILayoutPriority(749), for: .vertical)

        return imageView
    }()

    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 19)
        label.textColor = .secondaryLabel
        label.textAlignment = .center

        return label
    }()

    private lazy var artistAndAlbumLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = .label
        label.textAlignment = .center

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupViews()
    }

    private func setupViews() {
        coverImageView.image = UIImage(named: "roses")
        view.addSubview(coverImageView)

        coverImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        coverImageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true

        let stackView = UIStackView()
        stackView.axis = .horizontal
        trackNameLabel.text = "Sweet Child O' Mine"
        view.addSubview(trackNameLabel)
//        stackView.addArrangedSubview(trackNameLabel)

        trackNameLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 20).isActive = true
        trackNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        trackNameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true

        artistAndAlbumLabel.text = "Guns N' Roses - Appetite for Destruction"
        view.addSubview(artistAndAlbumLabel)

        artistAndAlbumLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 8).isActive = true
        artistAndAlbumLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        artistAndAlbumLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
//        stackView.addArrangedSubview(artistAndAlbumLabel)

//        view.addSubview(stackView)

//        stackView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 20).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    }
}
