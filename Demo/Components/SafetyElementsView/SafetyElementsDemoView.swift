import FinniversKit

class SafetyElementsDemoView: UIView, Tweakable {
    private lazy var safetyElementsView: SafetyElementsView = {
        let view = SafetyElementsView(withAutoLayout: true)
        view.useCompactLayout = false
        view.configure(with: sampleData)
        return view
    }()

    lazy var tweakingOptions: [TweakingOption] = {
        [
            TweakingOption(title: "Compact", description: "layout for compact horizontal size class") {
                self.safetyElementsView.useCompactLayout = true
            },
            TweakingOption(title: "Regular", description: "layout for regular horizontal size class") {
                self.safetyElementsView.useCompactLayout = false
            }
        ]
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if previousTraitCollection?.horizontalSizeClass != traitCollection.horizontalSizeClass {
            safetyElementsView.useCompactLayout = traitCollection.horizontalSizeClass == .compact
        }
    }

    let sampleData: [SafetyElementViewModel] = [
        SafetyElementViewModel(
            title: "Service",
            icon: UIImage(named: "service")!,
            body: "Selger garanterer at bilen har blitt vedlikeholdt i tråd med fabrikkens anbefalinger for service-intervall og øvrig vedlikehold.",
            externalLink: nil
        ),
        SafetyElementViewModel(
            title: "Garanti",
            icon: UIImage(named: "warranty")!,
            body: "Denne bilen selges med garanti. Nybilgaranti fra 1. gang reg. (60 mnd / 100 000 km)",
            externalLink: LinkButtonViewModel(
                buttonIdentifier: nil,
                buttonTitle: "Les mer om de forskjellige garantitypene på FINNs hjelpesenter.",
                linkUrl: URL(string: "https://hjelpesenter.finn.no/hc/no/articles/115002091069-Nytting-info-om-garanti-til-deg-som-skal-handle-bil-på-FINN") ?? URL(string: "https://google.com")!
            )
        ),
        SafetyElementViewModel(
            title: "Bytterett",
            icon: UIImage(named: "warranty")!,
            body: "Denne bilen selges med bytterett fra forhandler. Det betyr at du som kjøper har mulighet til å bytte den mot en annen bil, i henhold til forhandlerens vilkår. Dette kan du gjøre dersom bilen du har kjøpt av en eller annen grunn ikke tilfredsstiller dine forventninger eller behov. Produktet tilbys for at du som kjøper skal føle deg helt trygg på at du ender opp med riktig bil for ditt behov.",
            externalLink: nil
        ),
        SafetyElementViewModel(
            title: "Medlem",
            icon: UIImage(named: "warranty")!,
            body: "Når du kjøper bil av en forhandler som er medlem av NBF, handler du av en forhandler som har forpliktet seg til å følge NBF etiske retningslinjer. Dette gir deg som kjøper en ekstra trygghet.",
            externalLink: LinkButtonViewModel(
                buttonIdentifier: nil,
                buttonTitle: "Les mer om fordelene ved å handle av et NBF medlem.",
                linkUrl: URL(string: "https://www.finn.no/nbf.html") ?? URL(string: "https://google.com")!
            )
        ),
    ]

    // MARK: - Private methods
    private func setup() {
        addSubview(safetyElementsView)
        layoutMargins = UIEdgeInsets(all: .mediumLargeSpacing)

        NSLayoutConstraint.activate([
            safetyElementsView.topAnchor.constraint(equalTo: topAnchor, constant: .veryLargeSpacing),
            safetyElementsView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            safetyElementsView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
}
