import CoreGraphics

//MARK: - Reusable identifiers
struct AppConstants {
    static let ExpandableCell = "ExpandableCell"
    static let UserTableViewCell = "UserTableViewCell"
    static let CustomCell = "CustomCell"
    static let BooksCollectionCell = "BooksCollectionCell"
    static let HeaderCell = "HeaderCell"
    static let FooterCell = "FooterCell"
    static let HeaderText = "Header"
    static let FooterText = "Footer"
    static let EmailCell = "EmailCell"
    static let BorderWidth = 4.0
    static let MinimumLineSpacing = 10.0
    static let MinimumInterItemSpacing = 0.0
    static let FontSizeForEmail = 11.0
    static let SwitchEnableText = "Editing is enabled"
    static let SwitchDisableText = "Editing is disabled"
    static let SwitchCornerRadius = 15
    static let TextViewString = "Hello this is set programatically"
    static let TextFieldPasswordPlaceholder = "Password"
    static let SegmentSunriseTitle = "Field Sunrise"
    static let SegmentSunsetTitle = "Beach Sunset"
    static let ProgressViewMinimumProgress: Float = 0.0
    static let ProgressViewMaximumProgress: Float = 1.0
    static let ProgressViewTimeInterval: Double = 0.5
    static let ProgressViewProgress: Float = 0.1
    static let ScrollViewStatus = "Scrolling...."
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

