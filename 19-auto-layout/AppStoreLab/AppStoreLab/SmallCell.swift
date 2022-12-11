//
//  SmallCell.swift
//  AppStoreLab
//
//  Created by Mehmet Tarhan on 10/12/2022.
//

import UIKit

class SmallCell: UICollectionViewCell, SelfConfiguringCell {
    static var resuseIdentifier: String = "SmallCell"

    let nameLabel = UILabel()
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
        nameLabel.text = app.name
        imageView.image = UIImage(named: app.image)
    }

    private func setupViews() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        nameLabel.textColor = .label

        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true

        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultHigh, for: .vertical)

        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 20
        
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }
}
