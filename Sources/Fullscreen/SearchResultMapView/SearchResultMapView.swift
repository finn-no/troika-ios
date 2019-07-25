//
//  Copyright © 2019 FINN AS. All rights reserved.
//

import MapKit

public final class SearchResultMapView: UIView {

    private var didSetupView = false

    public var model: SearchResultMapViewModel? {
        didSet {
            if let region = model?.defaultRegion {
                mapView.setRegion(region, animated: false)
            }
        }
    }

    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.delegate = self
        view.isRotateEnabled = false
        view.isPitchEnabled = false
        view.showsUserLocation = true

        // TOOD: Set theese with open func configure
        view.addOverlay(FinnMapTile(withMapType: .map), level: .aboveLabels)

        return view
    }()

    private lazy var mapSettingsButton: MapSettingsButton = {
        let mapSettingsButton = MapSettingsButton(withAutoLayout: true)
        mapSettingsButton.delegate = self
        return mapSettingsButton
    }()

    // MARK: - Public

    public override func layoutSubviews() {
        super.layoutSubviews()

        if didSetupView == false {
            setup()
            didSetupView = true
        }
    }

    // MARK: - Setup

    private func setup() {
        backgroundColor = .milk

        addSubview(mapView)
        mapView.fillInSuperview()
        mapView.addSubview(mapSettingsButton)

        NSLayoutConstraint.activate([
            mapSettingsButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 8),
            mapSettingsButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -8)
            ])
    }

}

// MARK: - Extensions

extension SearchResultMapView: MapSettingsButtonDelegate {
    public func mapSettingsButtonDidSelectChangeMapTypeButton(_ view: MapSettingsButton) {

    }

    public func mapSettingsButtonDidSelectCenterMapButton(_ view: MapSettingsButton) {

    }
}

extension SearchResultMapView: MKMapViewDelegate {

    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let overlay = overlay as? MKTileOverlay {
            return MKTileOverlayRenderer(tileOverlay: overlay)
        }

        return MKOverlayRenderer(overlay: overlay)
    }

}
