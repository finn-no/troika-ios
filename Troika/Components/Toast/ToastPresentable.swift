import Foundation

public protocol ToastPresentable {
    var type: ToastType { get }
    var messageTitle: String { get }
    var accessibilityLabel: String { get }
    var actionButtonTitle: String? { get }
}

public extension ToastPresentable {
    var accessibilityLabel: String {
        return messageTitle
    }
}
