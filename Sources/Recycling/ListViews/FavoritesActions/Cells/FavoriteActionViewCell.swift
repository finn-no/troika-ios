//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

import UIKit

final class FavoriteActionViewCell: UITableViewCell {
    static let iconSize: CGFloat = 24
    static let separatorLeadingInset = .mediumLargeSpacing * 2 + FavoriteActionViewCell.iconSize

    private lazy var titleLabel = FavoriteActionViewCell.makeTitleLabel()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Init

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup

    public func configure(withTitle title: String, icon: FinniversImageAsset, tintColor: UIColor = .licorice) {
        titleLabel.text = title
        titleLabel.textColor = tintColor
        iconImageView.image = UIImage(named: icon).withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = tintColor
    }

    private func setup() {
        isAccessibilityElement = true
        separatorInset = .leadingInset(FavoriteActionViewCell.separatorLeadingInset)
        setDefaultSelectedBackgound()

        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            iconImageView.widthAnchor.constraint(equalToConstant: FavoriteActionViewCell.iconSize),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),

            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: .mediumLargeSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing)
        ])
    }
}

// MARK: - Factory

extension FavoriteActionViewCell {
    static func makeTitleLabel() -> UILabel {
        let label = UILabel(withAutoLayout: true)
        label.font = .bodyStrong
        label.textColor = .licorice
        return label
    }
}
