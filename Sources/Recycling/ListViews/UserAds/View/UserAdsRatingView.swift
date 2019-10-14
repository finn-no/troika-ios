import UIKit

public protocol UserAdsRatingViewDelegate: AnyObject {
    func ratingView(_ userAdsRatingView: UserAdsRatingView, didTapCloseButton button: UIButton)
    func ratingView(_ userAdsRatingView: UserAdsRatingView, textFor rating: HappinessRating) -> String?
    func ratingView(_ userAdsRatingView: UserAdsRatingView, didSelectRating rating: HappinessRating)
}

public class UserAdsRatingView: UIView {
    private lazy var closeButton: UIButton = {
        let button = UIButton(withAutoLayout: true)
        let image = UIImage(named: .close).withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.tintColor = .primaryBlue
        button.setImage(imageView.image, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var titleLabel: Label = {
        let label = Label(style: .bodyRegular, withAutoLayout: true)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var happinessRating: HappinessRatingView = {
        let view = HappinessRatingView(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var gradientWrapper: UIView = {
        let view = UIView(withAutoLayout: true)
        view.backgroundColor = .marble
        return view
    }()

    private lazy var gradientLayer: CALayer = {
        let layer = CAGradientLayer()
        let color = UIColor.white.withAlphaComponent(0.75)
        layer.colors = [UIColor.marble.cgColor, UIColor.marble.cgColor, color.cgColor]
        layer.locations = [0.1, 0.5, 1.0]
        return layer
    }()

    public weak var delegate: UserAdsRatingViewDelegate?

    public var model: UserAdsListRatingViewModel? {
        didSet {
            guard let model = model else { return }
            titleLabel.text = model.title
        }
    }

    // MARK: - Superclass Overrides

    public init(frame: CGRect = .zero, delegate: UserAdsRatingViewDelegate?) {
        super.init(frame: frame)
        self.delegate = delegate
        setup()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = gradientWrapper.bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors

    @objc func didTapCloseButton(_ sender: UIButton) {
        delegate?.ratingView(self, didTapCloseButton: sender)
    }
}

private extension UserAdsRatingView {
    func setup() {
        backgroundColor = .marble

        addSubview(closeButton)
        addSubview(titleLabel)
        addSubview(happinessRating)

        addSubview(gradientWrapper)
        gradientWrapper.layer.addSublayer(gradientLayer)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: .mediumLargeSpacing),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.mediumLargeSpacing),

            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .largeSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.largeSpacing),

            happinessRating.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .largeSpacing),
            happinessRating.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .mediumLargeSpacing),
            happinessRating.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.mediumLargeSpacing),

            gradientWrapper.topAnchor.constraint(equalTo: happinessRating.bottomAnchor, constant: .largeSpacing),
            gradientWrapper.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientWrapper.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientWrapper.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension UserAdsRatingView: HappinessRatingViewDelegate {
    public func happinessRatingView(_ happinessRatingView: HappinessRatingView, textFor rating: HappinessRating) -> String? {
        return delegate?.ratingView(self, textFor: rating)
    }

    public func happinessRatingView(_ happinessRatingView: HappinessRatingView, didSelectRating rating: HappinessRating) {
        delegate?.ratingView(self, didSelectRating: rating)
    }
}
