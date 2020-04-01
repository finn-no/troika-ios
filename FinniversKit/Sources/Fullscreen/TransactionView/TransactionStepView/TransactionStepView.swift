//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

import UIKit

public protocol TransactionStepViewDelegate: AnyObject {
    func transactionStepViewDidTapActionButton(
        _ view: TransactionStepView,
        inTransactionStep step: Int,
        withAction action: TransactionStepContentView.ActionButton.Action,
        withUrl urlString: String?,
        withFallbackUrl fallbackUrlString: String?
    )
}

public enum TransactionStepViewState: String {
    case notStarted = "not_started"
    case active = "active"
    case completed = "completed"

    public init(rawValue: String) {
        switch rawValue {
        case "not_started":
            self = .notStarted
        case "active":
            self = .active
        case "completed":
            self = .completed
        default:
            fatalError("No state exists for rawValue: '\(rawValue)'")
        }
    }

    public var style: TransactionStepView.Style {
        switch self {
        case .notStarted:
            return .notStarted
        case .active:
            return .active
        case .completed:
            return .completed
        }
    }
}

public class TransactionStepView: UIView {
    // MARK: - Public properties

    public weak var delegate: TransactionStepViewDelegate?

    // MARK: - Private properties

    private var step: Int
    private var model: TransactionStepViewModel
    private var style: TransactionStepView.Style
    private var customStyle: TransactionStepView.CustomStyle? // Styling provided by the backend

    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(withAutoLayout: true)
        view.backgroundColor = customStyle?.backgroundColor ?? style.backgroundColor
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .leading
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()

    // MARK: - Init

    public init(
        step: Int,
        model: TransactionStepViewModel,
        isLastStep: Bool = false,
        withCustomStyle customStyle: TransactionStepView.CustomStyle? = nil,
        withAutoLayout autoLayout: Bool = false
    ) {
        self.step = step
        self.model = model
        self.style = model.state.style
        self.customStyle = customStyle

        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = !autoLayout
        setup()
    }

    private func setup() {
        backgroundColor = customStyle?.backgroundColor ?? style.backgroundColor
        layer.cornerRadius = style.cornerRadius

        if let mainContent = model.main {
            let mainContentView = TransactionStepContentView(
                step: step,
                state: model.state,
                model: mainContent,
                withFontForTitle: .title3Strong,
                withColorForTitle: style.titleTextColor,
                withAutoLayout: true
            )

            mainContentView.delegate = self
            verticalStackView.addArrangedSubview(mainContentView)
        }

        if let detailContent = model.detail {
            let detailContentView = TransactionStepContentView(
                step: step,
                state: model.state,
                model: detailContent,
                withFontForTitle: .captionStrong,
                withColorForTitle: style.detailTextColor,
                withAutoLayout: true
            )

            detailContentView.delegate = self
            verticalStackView.addArrangedSubview(detailContentView)
        }

        addSubview(verticalStackView)
        verticalStackView.fillInSuperview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransactionStepView: TransactionStepContentViewDelegate {
    public func transactionStepContentViewDidTapActionButton(
        _ view: TransactionStepContentView,
        inTransactionStep step: Int,
        withAction action: TransactionStepContentView.ActionButton.Action,
        withUrl urlString: String?,
        withFallbackUrl fallbackUrlString: String?
    ) {
        delegate?.transactionStepViewDidTapActionButton(
            self,
            inTransactionStep: step,
            withAction: action,
            withUrl: urlString,
            withFallbackUrl: fallbackUrlString
        )
    }
}
