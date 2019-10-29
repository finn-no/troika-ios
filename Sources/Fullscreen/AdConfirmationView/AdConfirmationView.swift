//
//  Copyright © 2019 FINN AS. All rights reserved.
//

import UIKit

public class AdConfirmationView: UIView {
    private lazy var confirmationObjectView: AdConfirmationObjectView = {
        let view = AdConfirmationObjectView(withAutoLayout: true)
        return view
    }()

    private lazy var confirmationSummaryView: AdConfirmationSummaryView? = {
        let view = AdConfirmationSummaryView(withAutoLayout: true)
        return view
    }()

    private lazy var actionButton: Button = {
        let actionButton = Button(style: .callToAction, size: .normal, withAutoLayout: true)
        return actionButton
    }()

    public var model: AdConfirmationViewModel? {
        didSet {
            confirmationObjectView.model = model?.objectViewModel
            confirmationSummaryView?.model = model?.summaryViewModel
            actionButton.setTitle(model?.completeActionLabel, for: .normal)
        }
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AdConfirmationView {
    func setup() {
        addSubview(confirmationObjectView)
        confirmationObjectView.fillInSuperview()
    }
}
