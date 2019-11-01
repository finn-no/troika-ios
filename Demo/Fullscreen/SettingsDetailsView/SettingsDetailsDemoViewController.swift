//
//  Copyright © 2019 FINN AS. All rights reserved.
//

import FinniversKit

private struct DemoViewModel: SettingsDetailsViewModel {
    var icon: UIImage {
        return UIImage(named: "nyhetsbrev-fra-finn")!
    }

    var title: String {
        return "Nyhetsbrev fra FINN"
    }

    var primaryButtonStyle: Button.Style {
        return .callToAction
    }

    var primaryButtonTitle: String {
        return "Skru på nyhetsbrev"
    }

    func text(for state: SettingsDetailsView.State) -> String {
        switch state {
        case .normal:
            return "FINN sender deg nyhetsbrev med for eksempel reisetips, jobbtrender, morsomme konkurranser og smarte råd til deg som kjøper og selger. For å gjøre dette bruker vi kontakt-informasjonen knyttet til brukeren din på FINN."
        case .details:
            return "Formål\nVi ønsker å tilby bedre tjenester gjennom å gi deg mer relevant innhold. Dette kan f.eks være tjenester som anbefalinger på forsiden av FINN, FINN-annonser du har gått glipp av kan vises på andre nettsteder som VG, Facebook, etc., sortering av søkeresultat, mm.\n\nHvilke data trenger vi?\nFor å kunne lage slike tjenester trenger vi å lagre data om din bruk av FINN. Dette vil typisk være hvilke annonser du har vist interesse for, din søkehistorikk, stedsinformasjon og lignende.\n\nHvordan virker dette?\nVi bruker ditt bruksmønster til å finne tilsvarende bruksmønster fra andre brukere på FINN, for å kunne anbefale deg det de har vist interesse for. Du vil ikke kunne bli identifisert gjennom dataene vi lagrer, og vi deler heller ikke disse dataene med andre."
        }
    }

    func textAlignment(for state: SettingsDetailsView.State) -> NSTextAlignment {
        switch state {
        case .normal: return .center
        case .details: return .left
        }
    }

    func secondaryButtonTitle(for state: SettingsDetailsView.State) -> String? {
        switch state {
        case .normal: return "Les mer"
        case .details: return "Les mindre"
        }
    }
}

final class SettingsDetailsDemoViewController: UIViewController {

    private lazy var settingsDetailsView: SettingsDetailsView = {
        let detailsView = SettingsDetailsView(withAutoLayout: true)
        detailsView.configure(with: DemoViewModel())
        detailsView.delegate = self
        return detailsView
    }()

    lazy var bottomSheet: BottomSheet = {
        view.layoutIfNeeded()
        let contentHeight = settingsDetailsView.contentSize.height + 20

        let bottomSheet = BottomSheet(
            rootViewController: self,
            height: .init(
                compact: contentHeight,
                expanded: contentHeight
            )
        )

        return bottomSheet
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsDetailsView)
        settingsDetailsView.fillInSuperview()
    }
}

extension SettingsDetailsDemoViewController: SettingsDetailsViewDelegate {
    func settingsDetailsView(_ detailsView: SettingsDetailsView, didChangeTo state: SettingsDetailsView.State, with model: SettingsDetailsViewModel) {
        view.layoutIfNeeded()
        let contentHeight = settingsDetailsView.contentSize.height + 20
        let height = min(contentHeight, BottomSheet.Height.defaultFilterHeight.expanded)
        bottomSheet.height = .init(compact: height, expanded: height)
    }

    func settingsDetailsView(_ detailsView: SettingsDetailsView, didTapPrimaryButtonWith model: SettingsDetailsViewModel) {
        print("Did tap action button with model:\n\t- \(model)")
    }
}