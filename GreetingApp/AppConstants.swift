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
    static let singleComponentInPickerView = 1
    static let mapViewCallOutSubtitle = "Welcome to "
    static let customAnnotationIdentifier = "CustomPin"
    static let customAnnotationImage = "myLocation"
    static let onboardingScreenCell = "OnboardingScreenCell"
    static let onboardingPage = 1
    static let defaultLatLong = 30.0
    static let selectionLimit = 3
    static let storyboardNavigationController = "NavigationController"
    static let senderVC = "SenderVC"
    static let receiverVC = "ReceiverVC"
    static let firstViewController = "FirstVC"
    static let navigationControllerVC = "NavigationControllerVC"
    static let secondViewController = "SecondVC"
    static let thirdViewController = "ThirdVC"
    static let presentStylesVC = "PresentStylesVC"
    static let fourthVC = "FourthVC"
    static let overFullScreenAlpha = 0.4
    
    static let barButtonTitle = "Menu"
    static let navigationScreenTitle = "Navigation Controller"
    static let menuProfile = "Profile"
    static let menuBrightness  = "Brightness"
    static let menuDocuments = "Documents"
    static let menuBookMarks = "BookMarks"
    
    //MARK: - View controllers
    static let uiComponentsHomeScreen = "UIComponentsHomeScreenVC"
    static let textFieldVC = "TextFieldVC"
    static let homeViewController = "HomeViewController"
    static let labelVC = "LabelVC"
    static let switchVC = "SwitchVC"
    static let textViewVC = "TextViewVC"
    static let segmentedControlVC = "SegmentedControlVC"
    static let progressViewVC = "ProgressViewVC"
    static let sliderVC = "SliderVC"
    static let stepperVC = "StepperVC"
    static let scrollVC = "ScrollVC"
    static let tabBarVC = "TabBar"
    static let geeksForGeeksWebViewVC = "GeeksForGeeks"
    static let mapViewVC = "MapView"
    static let pickerViewVC = "PickerView"
    static let imagePickerVC = "ImagePicker"
    static let stackViewVC = "StackViewVC"
    static let searchBarVC = "SearchBar"
    static let buttonVC = "ButtonVC"
    static let tableViewVC = "TableViewVC"
    static let collectionViewVC = "CollectionView"
    static let userTableViewVC = "UserTableViewVC"
    static let expandableSectionsVC = "ExpandableVC"
    static let customTableVC = "CustomTableVC"
    static let onBoardingScreenVC = "OnboardingScreenVC"
    static let userDetailVC = "UserDetailVC"
    static let uploadImageVC = "UploadImageVC"
    static let railwayVC = "RailwayVC"
    
    //MARK: - CustomTableVC
    static let customTableAddButtonTitle =  "Add Data"
    static let customTableAlertTitle = "Add Name"
    static let customTableAlertMessage = "Please enter your name"
    static let customTableAlertPlaceholder = "First letter should be capital "
    static let customTableAlertButtonCancel = "Cancel"
    static let customTableAlertButtonContinue = "Continue"
    static let customTableAddFail = "Couldn't Add Name"
    static let customTableButtonCornerRadius = 10.0
    static let estimatedRowHeight = 44.0
    
    //MARK: - UserTableVC
    static let userTableCellCornerRadius = 10.0
    static let userTableCellBorderWidth = 5.0
    
    //MARK: - ParkingLotVc
    static let parkingLotVC = "ParkingLotVC"
    static let parkingLotTitle = "Home"
    static let parkingLotCellIdentifier = "ParkingLotCell"
    static let parkingLotResumeIcon = "play.circle"
    static let parkingLotPauseIcon = "pause.circle"
    static let parkingLotHeaderCell = "ParkingLotHeaderCell"
    static let parkingLotTimeSheetCell = "ParkingLotTimeSheetCell"
    static let parkingLotCanNotParkMessage = "Parking Lot is already full. please find another lot "
    static let parkingLotOKButtonTitle = "OK"
    static let parkingLotCanNotParkTitle = "Can't Park !!!"
    static let parkingLotTimeSheetSectionCount = 1
    static let parkingLotHeightDivider = 15.0
    static let parkingLotHeaderHeightDivider = 16.0
    
    //MARK: - ProfileVC
    static let profileScreenVC = "ProfileScreenVC"
    static let changeEmailVC = "ChangeEmailVC"
    static let closeAccountVC = "CloseAccountVC"
    static let profileScreenRightBarButtonTitle = "Save"
    static let profileScreenNavigationTitle = "Profile"
    static let profileScreenViewCornerRadius = 4.0
    static let profileScreenViewBorderWidth = 1.0
    static let profileSCreenAddressMaxLines = 3
    static let changeEmailVCHeight = 375.0
    static let closeAccountHeight = 325.0
    
    //MARK: - UserList
    static let userListCellTableViewCell = "UserListCellTableViewCell"
    static let userListVC = "UserListVC"
    static let userListSectionCount = 1
    static let userListHeightDivider = 8.0
    static let exceptionMessage = "Data can not be decoded!!"
    
    //MARK: - RailwayVC
    static let railwayCell = "RailwayCell"

    
}

//MARK: - Storyboards
struct Storyboards {
    static let uiComponentsPart1 = UIStoryboard(name: "UIComponentsPart1", bundle: nil)
    static let uiComponentsSecondPart = UIStoryboard(name: "UIComponentsSecondPart", bundle: nil)
    static let pickerView = UIStoryboard(name: "PickerView", bundle: nil)
    static let stackViewAndToolBar = UIStoryboard(name: "StackViewAndToolBar", bundle: nil)
    static let tabBar = UIStoryboard(name: "TabBar", bundle: nil)
    static let imagePicker = UIStoryboard(name: "ImagePicker", bundle: nil)
    static let searchBar = UIStoryboard(name: "SearchBar", bundle: nil)
    static let mapView = UIStoryboard(name: "MapView", bundle: nil)
    static let navigationController = UIStoryboard(name: "NavigationController", bundle: nil)
    static let onBoardingScreen = UIStoryboard(name: "OnboardingScreen", bundle: nil)
    static let parkingLotScreen = UIStoryboard(name: "ParkingLotScreen", bundle: nil)
    static let profileScreen = UIStoryboard(name:"ProfileScreen", bundle: nil)
    static let userListStoryboard = UIStoryboard(name: "UserListStoryboard", bundle: nil)
    static let railwayStoryboard = UIStoryboard(name: "RailwayStoryboard", bundle: nil)

}

//MARK: - Custom Color
struct CustomColor {
    static let parkingLotNavigationBarColor = "parkingNavigationBar"
    static let parkingLotSelectedSegment = "parkingLotSelectedSegment"
    static let parkingLotSegmentBackground = "parkingLotSegmentBackground"
    static let parkingLotUnselectedSegmentColor = "parkingLotUnselectedSegmentColor"
    static let dimmWhite = "dimmWhite"
    static let reverseKTNavigationBarColor = "reverseKTNavigationBarColor"
    static let profileScreenBorderColor = "profileScreenBorderColor"
    static let btnDismissColor = "btnDismissColor"
    static let warningColor = "warningColor"
    static let railwayPrimary = "railwayPrimary"
    
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

enum FruitsScopeIndex: Int {
    case winter = 0
    case summer = 1
}

enum FruitsScopeTitles: String {
    case winter
    case summer
}

enum ParkingLotSegments: Int {
    case markAttendance = 0
    case timeSheet
}

enum UserListPageNumberSegment: Int {
    case first
    case second 
}
