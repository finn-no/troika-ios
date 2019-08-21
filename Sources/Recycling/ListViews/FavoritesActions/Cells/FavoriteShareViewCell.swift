//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

import UIKit

protocol FavoriteShareViewCellDelegate: AnyObject {
    func favoriteShareViewCell(_ cell: FavoriteShareViewCell, didChangeValueFor switchControl: UISwitch)
}

final class FavoriteShareViewCell: UITableViewCell {
    weak var delegate: FavoriteShareViewCellDelegate?

    private lazy var titleLabel = FavoriteActionViewCell.makeTitleLabel()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.image = UIImage(named: .favoritesShare).withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .licorice
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var switchControl: UISwitch = {
        let control = UISwitch(withAutoLayout: true)
        control.onTintColor = .primaryBlue
        control.addTarget(self, action: #selector(handleSwitchValueChange), for: .valueChanged)
        return control
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

    func configure(withTitle title: String, switchOn: Bool) {
        titleLabel.text = title
        switchControl.isOn = switchOn
    }

    private func setup() {
        isAccessibilityElement = true
        separatorInset = .leadingInset(FavoriteActionViewCell.separatorLeadingInset)
        selectionStyle = .none

        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(switchControl)

        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            iconImageView.widthAnchor.constraint(equalToConstant: FavoriteActionViewCell.iconSize),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),

            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: .mediumLargeSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: switchControl.leadingAnchor, constant: -.mediumLargeSpacing),

            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing)
        ])
    }

    // MARK: - Action

    @objc private func handleSwitchValueChange() {
        delegate?.favoriteShareViewCell(self, didChangeValueFor: switchControl)
    }
}
