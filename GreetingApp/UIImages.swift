import UIKit

extension UIImage {
    static let atomicHabits = "atomicHabits"
    static let attitudeIsEverything = "attitudeIsEverything"
    static let psychologyOfMoney = "psychologyOfMoney"
    static let sherlockHolmes = "sherlockHolmes"
    static let theAlchemist = "theAlchemist"
    static let theGirlWhoKnewTooMuch = "theGirlWhoKnewTooMuch"
    static let youOnlyLiveOnce = "youOnlyLiveOnce"
    static let field = "field"
    static let beachSunset = "beach_sunset"
    static let show = "show"
    static let userIcon = "user-icon"
    static let wingsOfFires = "wingsOfFire"
    static let onBoardingScreenPage1 = "onboardingScreenPage1"
    static let onBoardingScreenPage2 = "onboardingScreenPage2"
    static let onBoardingScreenPage3 = "onboardingScreenPage3"
    static let menuProfileIcon = "person"
    static let menuBrightnessIcon = "sun.max"
    static let menuDocumentsIcon = "doc"
    static let menuBookmarksIcon = "book.fill"

    //MARK: - Parking lot
    static let parkingLotNotifications = "bell"
    static let parkingLotMenu = "line.horizontal.3"
    
    //MARK: - ProfileScreen
    static let profilePicture = "proflePicture"
    static let ovalProfilePicture = "Oval"
    static let pathBadge = "Path"
    static let iconPencil = "iconPencil"
    static let dismissIcon = "xmark.circle"
    static let menuProfileScreen = "menuProfileScreen"
    
    //MARK: - getImage
    static func getImage( _ image: String) -> UIImage? {
        return UIImage(systemName: image) ?? UIImage()
    }
}

