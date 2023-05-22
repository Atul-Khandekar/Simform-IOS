import CoreGraphics
import UIKit

//MARK: - Reusable identifiers
struct AppConstants {
    static let expandableCell = "ExpandableCell"
    static let userTableViewCell = "UserTableViewCell"
    static let customCell = "CustomCell"
    static let booksCollectionCell = "BooksCollectionCell"
    static let headerCell = "HeaderCell"
    static let footerCell = "FooterCell"
    static let headerText = "Header"
    static let footerText = "Footer"
    static let emailCell = "EmailCell"
    static let borderWidth = 4.0
    static let minimumLineSpacing = 10.0
    static let minimumInterItemSpacing = 0.0
    static let fontSizeForEmail = 11.0
    static let switchEnableText = "Editing is enabled"
    static let switchDisableText = "Editing is disabled"
    static let switchCornerRadius = 15
    static let textViewString = "Hello this is set programatically"
    static let textFieldPasswordPlaceholder = "Password"
    static let segmentSunriseTitle = "Field Sunrise"
    static let segmentSunsetTitle = "Beach Sunset"
    static let progressViewMinimumProgress: Float = 0.0
    static let progressViewMaximumProgress: Float = 1.0
    static let progressViewTimeInterval: Double = 0.5
    static let progressViewProgress: Float = 0.1
    static let scrollViewStatus = "Scrolling...."
    static let filterString = "apple"
    static let searchBarPlaceholder = "Enter the Text"
    static let searchBarPrompt = "Fruit Search"
    static let emptyString = ""
    static let searchBarCell = "SearchBarCell"
    static let dateFormat = " MMM dd , yyyy"
    static let britishTimeFormat24Hr = "en_gb"
    static let numberOfComponentsInPicker = 1
    static let alertTitleForToolBar = "Alert"
    static let enableEditingToolBar = "Editing is enabled"
    static let disableEditingToolBar = "Editing is disabled"
    static let tblFruitsInsets = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    static let lettersCountInFruits = 6
}

//MARK: - Enum Constants
enum SegmentControl: Int {
    case sunrise = 0
    case sunset = 1
}

enum Slider: Int {
    case min = 0
    case max = 100
}

enum BooksAndEmailsSections: Int {
    case books = 0
    case emails = 1
}

enum ProgressViewStates: String {
    case start = "Start"
    case stop = "Stop"
}

enum Colors: Int {
    case Red
    case Blue
    case Green
    case Yellow
    case Pink
    case Orange
}

enum FruitsScopeIndex: Int {
    case winter = 0
    case summer = 1
}

enum FruitsScopeTitles: String {
    case winter
    case summer
}
