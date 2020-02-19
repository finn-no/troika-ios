//
//  Copyright © 2020 FINN AS. All rights reserved.
//

import Foundation
import UIKit

public class UserAdTableViewCell: UITableViewCell {

    // MARK: - Public properties

    public var remoteImageViewDataSource: RemoteImageViewDataSource? {
        didSet {
            userAdDetailsView.adImageViewDataSource = remoteImageViewDataSource
        }
    }

    public var loadingColor: UIColor? {
        didSet {
            userAdDetailsView.loadingColor = loadingColor
        }
    }

    // MARK: - Private properties

    private lazy var userAdDetailsView: UserAdDetailsView = UserAdDetailsView(withAutoLayout: true)

    private lazy var userAdDetailsViewTopAnchor = userAdDetailsView.topAnchor.constraint(equalTo: contentView.topAnchor)
    private lazy var userAdDetailsViewBottomAnchor = userAdDetailsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0, priority: .init(999))

    // MARK: - Init

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        isAccessibilityElement = true
        backgroundColor = .bgPrimary
        selectionStyle = .none

        contentView.addSubview(userAdDetailsView)

        NSLayoutConstraint.activate([
            userAdDetailsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userAdDetailsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            userAdDetailsViewTopAnchor,
            userAdDetailsViewBottomAnchor,
        ])
    }

    // MARK: Public methods

    public func configure(with style: UserAdTableViewCellStyle, model: UserAdTableViewCellViewModel) {
        separatorInset = .leadingInset(.largeSpacing + style.imageSize)
        accessibilityLabel = model.accessibilityLabel

        userAdDetailsView.configure(with: style, model: model)
    }

    // MARK: - Overrides

    public override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
        userAdDetailsView.resetContent()
    }
}

// MARK: - ImageLoading

extension UserAdTableViewCell: ImageLoading {
    public func loadImage() {
        userAdDetailsView.loadImage()
    }
}
