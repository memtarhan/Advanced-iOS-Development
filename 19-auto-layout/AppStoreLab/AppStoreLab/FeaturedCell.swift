//
//  FeaturedCell.swift
//  AppStoreLab
//
//  Created by Mehmet Tarhan on 10/12/2022.
//

import UIKit

class FeaturedCell: UICollectionViewCell, SelfConfiguringCell {
    static var resuseIdentifier: String = "FeaturedCell"

    let taglineLabel = UILabel()
    let nameLabel = UILabel()
    let subtitleLabel = UILabel()
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupViews()
    }

    func configure(withApp app: App) {
        taglineLabel.text = app.tagline.uppercased()
        nameLabel.text = app.name
        subtitleLabel.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }

    private func setupViews() {
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel

        taglineLabel.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 12, weight: .bold))
        taglineLabel.textColor = .systemBlue

        nameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        nameLabel.textColor = .label

        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        subtitleLabel.textColor = .secondaryLabel

        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit

        let stackView = UIStackView(arrangedSubviews: [separator, taglineLabel, nameLabel, subtitleLabel, imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),

            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])

        stackView.setCustomSpacing(10, after: separator)
        stackView.setCustomSpacing(10, after: subtitleLabel)
    }
}
