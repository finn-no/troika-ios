//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

import UIKit

protocol FavoriteFolderCopyLinkCellDelegate: AnyObject {
    func favoriteFolderCopyLinkCellDidSelectButton(_ cell: FavoriteFolderCopyLinkCell)
}

final class FavoriteFolderCopyLinkCell: UITableViewCell {
    weak var delegate: FavoriteFolderCopyLinkCellDelegate?

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.image = UIImage(named: .favoritesCopyLink).withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .licorice
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.font = .caption
        label.textColor = .licorice
        return label
    }()

    private lazy var button: UIButton = {
        let button = Button(style: .flat)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        return button
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup

    func configure(withButtonTitle buttonTitle: String, description: String) {
        descriptionLabel.text = description
        button.setTitle(buttonTitle, for: .normal)
    }

    private func setup() {
        isAccessibilityElement = true
        backgroundColor = .ice
        selectionStyle = .none

        contentView.addSubview(iconImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            iconImageView.widthAnchor.constraint(equalToConstant: FavoriteActionCell.iconSize),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),

            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: .mediumLargeSpacing),
            descriptionLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -.mediumSpacing),

            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    // MARK: - Action

    @objc private func handleButtonTap() {
        delegate?.favoriteFolderCopyLinkCellDidSelectButton(self)
    }
}
