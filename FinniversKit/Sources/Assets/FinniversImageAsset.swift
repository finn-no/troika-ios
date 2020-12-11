//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

// Generated by generate_image_assets_symbols as a "Run Script" Build Phase
// WARNING: This file is autogenerated, do not modify by hand

import UIKit

private class BundleHelper {
}

extension UIImage {
    convenience init(named imageAsset: FinniversImageAsset) {
        #if SWIFT_PACKAGE
        let bundle = Bundle.module
        #else
        let bundle = Bundle(for: BundleHelper.self)
        #endif
        self.init(named: imageAsset.rawValue, in: bundle, compatibleWith: nil)!
    }

    @objc class func assetNamed(_ assetName: String) -> UIImage {
        #if SWIFT_PACKAGE
        let bundle = Bundle.module
        #else
        let bundle = Bundle(for: BundleHelper.self)
        #endif
        return UIImage(named: assetName, in: bundle, compatibleWith: nil)!
    }
}

//swiftlint:disable superfluous_disable_command
//swiftlint:disable type_body_length
enum FinniversImageAsset: String {
    case adManagementShare
    case adManagementTrashcan
    case arrowDown
    case arrowDownSmall
    case arrowRight
    case arrowUp
    case arrowUpSmall
    case attachment
    case avatar
    case bankID
    case betaPill
    case blinkRocketMini
    case blockUser
    case boat
    case calendar
    case camera
    case candyCane
    case car
    case check
    case checkCircle
    case checkCircleFilled
    case checkCircleFilledMini
    case checkmarkBig
    case christmasWishListBanner
    case classifieds
    case clock
    case close
    case confetti1
    case confetti2
    case creditcard
    case cross
    case distance
    case distanceOutlined
    case document
    case download
    case earthHourClock
    case earthHourEarth
    case earthHourEyes
    case earthHourHeart
    case earthHourStars
    case easterEgg
    case edit
    case editBig
    case error
    case exclamationMarkTriangleMini
    case eyeHide
    case favoriteActive
    case favoriteAdd
    case favoriteDefault
    case favoritesComment
    case favoritesDelete
    case favoritesEdit
    case favoritesNote
    case favoritesPlus
    case favoritesShare
    case favoritesShareLink
    case favoritesSortAdStatus
    case favoritesSortDistance
    case favoritesSortLastAdded
    case favoritesXmasButton
    case favoritesXmasFolder
    case favouriteAddImg
    case favouriteAdded
    case favouriteAddedImg
    case favourites
    case finnLogo
    case finnLogoSimple
    case gallery
    case gift
    case giftRoundedRectRed
    case giftSquarePink
    case giftSquareYellow
    case giftTriangleGreen
    case gridView
    case handshake
    case heartEmpty
    case heartEmptyDashed
    case help
    case hide
    case home
    case important
    case info
    case jobs
    case klimaboletBanner
    case listView
    case magnifyingGlass
    case mapDirections
    case mapDrawarea
    case mapMyposition
    case mc
    case messageUserRequired
    case messages
    case minus
    case miscCross
    case miscDislike
    case miscDisliked
    case miscLike
    case miscLiked
    case miscMoney
    case mittanbud
    case more
    case moreImg
    case moteplassen
    case motorTransaction
    case multipleContracts
    case navigation
    case noImage
    case notifications
    case notificationsBell
    case okonomi
    case ornamentCircleBlue
    case ornamentCircleRed
    case ornamentStar
    case pencilPaper
    case pin
    case playVideo
    case plusMini
    case primingFavoritesComments
    case primingFavoritesSearch
    case primingFavoritesSharing
    case rate
    case rated
    case ratingCat
    case ratingFaceAngry
    case ratingFaceDissatisfied
    case ratingFaceHappy
    case ratingFaceLove
    case ratingFaceNeutral
    case ratings
    case remove
    case republish
    case search
    case searchBig
    case send
    case settings
    case share
    case shopping
    case sliderThumb
    case sliderThumbActive
    case sold
    case speechbubbleSmiley
    case spidLogo
    case stakeholder
    case starOutline
    case statsEmpty
    case statsEnvelope
    case statsEye
    case statsHeart
    case success
    case travel
    case uncheckCircle
    case vehicles
    case view
    case viewMode
    case virtualViewing
    case webview
    case wrench
    case yourads

    static var imageNames: [FinniversImageAsset] {
        return [
            .adManagementShare,
            .adManagementTrashcan,
            .arrowDown,
            .arrowDownSmall,
            .arrowRight,
            .arrowUp,
            .arrowUpSmall,
            .attachment,
            .avatar,
            .bankID,
            .betaPill,
            .blinkRocketMini,
            .blockUser,
            .boat,
            .calendar,
            .camera,
            .candyCane,
            .car,
            .check,
            .checkCircle,
            .checkCircleFilled,
            .checkCircleFilledMini,
            .checkmarkBig,
            .christmasWishListBanner,
            .classifieds,
            .clock,
            .close,
            .confetti1,
            .confetti2,
            .creditcard,
            .cross,
            .distance,
            .distanceOutlined,
            .document,
            .download,
            .earthHourClock,
            .earthHourEarth,
            .earthHourEyes,
            .earthHourHeart,
            .earthHourStars,
            .easterEgg,
            .edit,
            .editBig,
            .error,
            .exclamationMarkTriangleMini,
            .eyeHide,
            .favoriteActive,
            .favoriteAdd,
            .favoriteDefault,
            .favoritesComment,
            .favoritesDelete,
            .favoritesEdit,
            .favoritesNote,
            .favoritesPlus,
            .favoritesShare,
            .favoritesShareLink,
            .favoritesSortAdStatus,
            .favoritesSortDistance,
            .favoritesSortLastAdded,
            .favoritesXmasButton,
            .favoritesXmasFolder,
            .favouriteAddImg,
            .favouriteAdded,
            .favouriteAddedImg,
            .favourites,
            .finnLogo,
            .finnLogoSimple,
            .gallery,
            .gift,
            .giftRoundedRectRed,
            .giftSquarePink,
            .giftSquareYellow,
            .giftTriangleGreen,
            .gridView,
            .handshake,
            .heartEmpty,
            .heartEmptyDashed,
            .help,
            .hide,
            .home,
            .important,
            .info,
            .jobs,
            .klimaboletBanner,
            .listView,
            .magnifyingGlass,
            .mapDirections,
            .mapDrawarea,
            .mapMyposition,
            .mc,
            .messageUserRequired,
            .messages,
            .minus,
            .miscCross,
            .miscDislike,
            .miscDisliked,
            .miscLike,
            .miscLiked,
            .miscMoney,
            .mittanbud,
            .more,
            .moreImg,
            .moteplassen,
            .motorTransaction,
            .multipleContracts,
            .navigation,
            .noImage,
            .notifications,
            .notificationsBell,
            .okonomi,
            .ornamentCircleBlue,
            .ornamentCircleRed,
            .ornamentStar,
            .pencilPaper,
            .pin,
            .playVideo,
            .plusMini,
            .primingFavoritesComments,
            .primingFavoritesSearch,
            .primingFavoritesSharing,
            .rate,
            .rated,
            .ratingCat,
            .ratingFaceAngry,
            .ratingFaceDissatisfied,
            .ratingFaceHappy,
            .ratingFaceLove,
            .ratingFaceNeutral,
            .ratings,
            .remove,
            .republish,
            .search,
            .searchBig,
            .send,
            .settings,
            .share,
            .shopping,
            .sliderThumb,
            .sliderThumbActive,
            .sold,
            .speechbubbleSmiley,
            .spidLogo,
            .stakeholder,
            .starOutline,
            .statsEmpty,
            .statsEnvelope,
            .statsEye,
            .statsHeart,
            .success,
            .travel,
            .uncheckCircle,
            .vehicles,
            .view,
            .viewMode,
            .virtualViewing,
            .webview,
            .wrench,
            .yourads,
    ]
  }
}
