//
//  MediumCollectionViewCell.swift
//  AppStoreLab
//
//  Created by Mehmet Tarhan on 10/12/2022.
//

import UIKit

class MediumCell: UICollectionViewCell, SelfConfiguringCell {
    static var resuseIdentifier: String = "MediumCell"

    let nameLabel = UILabel()
    let subtitleLabel = UILabel()
    let imageView = UIImageView()
    let buyButton = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupViews()
    }

    func configure(withApp app: App) {
        nameLabel.text = app.name
        subtitleLabel.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }

    private func setupViews() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.textColor = .label

        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .secondaryLabel

        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true

        buyButton.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)

        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultHigh, for: .vertical)

        let innerStackView = UIStackView(arrangedSubviews: [nameLabel, subtitleLabel])
        innerStackView.axis = .vertical

        let outerStackView = UIStackView(arrangedSubviews: [imageView, innerStackView, buyButton])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.axis = .horizontal
        outerStackView.alignment = .center
        outerStackView.spacing = 10

        contentView.addSubview(outerStackView)

        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),

        ])
    }
}
