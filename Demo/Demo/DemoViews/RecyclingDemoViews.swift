//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//
import FinniversKit

public enum RecyclingDemoViews: String, CaseIterable {
    case basicTableView
    case notificationsListView
    case favoriteFoldersListView
    case favoritesListView
    case savedSearchesListView
    case marketsGridView
    case adsGridView
    case settingsView
    case adManagementView
    case neighborhoodProfileView
    case paymentOptionsListView

    public static var items: [RecyclingDemoViews] {
        return allCases.sorted { $0.rawValue < $1.rawValue }
    }

    public var viewController: UIViewController {
        switch self {
        case .basicTableView:
            return DemoViewController<BasicTableViewDemoView>()
        case .notificationsListView:
            return DemoViewController<NotificationsListViewDemoView>()
        case .favoriteFoldersListView:
            let viewController = DemoViewController<FavoriteFoldersListDemoView>(constrainToBottomSafeArea: false)
            viewController.title = "Favoritter"

            let navigationController = NavigationController(rootViewController: viewController)
            navigationController.navigationBar.barTintColor = .bgPrimary
            navigationController.navigationBar.shadowImage = UIImage()

            return navigationController
        case .favoritesListView:
            return DemoViewController<FavoritesListViewDemoView>()
        case .savedSearchesListView:
            return DemoViewController<SavedSearchesListViewDemoView>()
        case .marketsGridView:
            return DemoViewController<MarketsGridViewDemoView>()
        case .adsGridView:
            return DemoViewController<AdsGridViewDemoView>()
        case .settingsView:
            return DemoViewController<SettingsViewDemoView>()
        case .adManagementView:
            return DemoViewController<AdManagementDemoView>()
        case .neighborhoodProfileView:
            return DemoViewController<NeighborhoodProfileDemoView>()
        case .paymentOptionsListView:
            return DemoViewController<PaymentOptionsListViewDemoView>()
        }
    }
}
