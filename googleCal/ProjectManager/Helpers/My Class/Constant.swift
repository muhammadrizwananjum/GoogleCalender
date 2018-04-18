//
//  Constant.swift
//  Flinkar_Driver
//
//  Created by Tecocraft on 28/06/17.
//  Copyright © 2017 Siddharth Vora. All rights reserved.
//

import UIKit


// APP INFORMATIONS //



// APP IDENTIFIERS //
let APPLE_LANGUAGE_KEY = "AppleLanguages"
let APP_Title = ""
var sAppXcelFolderPath = ""
var sAppSQLITEFolderPath = ""

let sAppSQLITEFolderName = ""
let sAppXcelFolderName = ""
let sAppDBFileName = ""

let emptyTemplate = ""
let heEmptyTemplate = ""

// VIEW-COLOR //
let THEME_COLOR = UIColor.init(hex: 0x45B32C)
let sDefaultThemeColor = UIColor(rgb: 0x075e54) //whatsapp theme color
let sDefaultGreyBGColor = UIColor(rgb: 0xece5dd) //defaultgray
let sDefaultBtnColor = UIColor(rgb: 0x128c7e) //Button Color
let sDefaultViewColorPrimary = sDefaultGreyBGColor //UIColor(rgb: 0xdcf8c6)  Whatsapp very light green background
let sDefaultViewColorSecondary = UIColor(rgb: 0xdcf8c6) //UIColor(rgb: 0xbff6a2) lightGreen
let sDefaultViewBlueColor = UIColor(rgb: 0x34b7f1) //blue whatsapp color
let sDefaultShowcaseBGColor = UIColor(rgb: 0x191970)
let sDefaultShowcaseHighlightColor = UIColor(rgb: 0x20B2AA)

// TEXT-COLOR //
let sDefaultTextColorPrimary = UIColor.white
let sDefaultTextColorSecondary = UIColor.black


// DEFAULTS //
let SCREEN = UIScreen.main.bounds
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

// SCREEN-SIZES //
let iphone4 = UIScreen.main.bounds.size.height == 480
let iphone5 = UIScreen.main.bounds.size.height == 568
let iphone6i7 = UIScreen.main.bounds.size.height == 667
let iphone6i7plus = UIScreen.main.bounds.size.height == 736

// FONT //
let sHelveticaNeue = "HelveticaNeue"
let sDefaultFontHelveticaNeueBold = "HelveticaNeue-Bold"
let sDefaultFontHelveticaNeueMedium = "HelveticaNeue-Medium"
let sDefaultFontHelveticaNeueThin = "HelveticaNeue-Thin"
// FONT- SIZE //
let sDefaultFontSizeVerySmall8=8.0
let sDefaultFontSizeVerySmall10=10.0
let sDefaultFontSizeSmall11=11.0
let sDefaultFontSizeSmall12=12.0
let sDefaultFontSizeMedium13=13.0
let sDefaultFontSizeMedium14=14.0
let sDefaultFontSizeLarge15=15.0
let sDefaultFontSizeLarge16=16.0
let sDefaultFontSizeExtraLarge18=18.0
let sDefaultFontSizeExtraLarge20=20.0
let sDefaultFontSizeExtraLarge22=22.0
let sDefaultFontSizeExtraLarge25=25.0
let sDefaultFontSizeExtraLarge28=28.0
let sDefaultFontSizeExtraLarge30=30.0
let sDefaultFontSizeExtraLarge32=32.0
let sDefaultFontSizeExtraLarge36=36.0
let sDefaultFontSizeExtraLarge40=40.0
let sDefaultFontSizeExtraLarge150=150.0


// APP LOADER //

let sLoaderSize = CGSize(width: 50.0, height: 50.0)
let sShowLoaderValue = 29
let sLoaderColor = UIColor.lightGray
let sLoaderTitle = "Loading...!"
let sLoaderTitleColor = UIColor.lightGray

// IMAGES //
let sPlaceholderImage = "placeholder.png"

// OTHERS IDENTIFIERS //


// STORY-BOARD IDENTIFIERS //
let sloginScreenID = "LoginVC"
let sLoginScreenRootId = "loginRootScreen"
let bHomeScreenID = "DashBoardVC"
let bHomeScreenRootId = "DashBoardRootVC"
let bBusinessProfileId = "BusinessProfileRootVC"

let cHomeScreenID = "BadgeHolderDashBoardVC"
let cHomeScreenRootId = "BadgeDashBoardRootVC"
let cCandidateProfileId = "CandidateProfileRootVC"

//KEY//
let sDeviceInfoKey = "postNIosDeviceInfo"
let sDeviceRegularInfoKey = "postIosDeviceInfo"

// Tost Msgs //

let internet_connection_error = "No Internet Connection"
let sAlertPlzTryLater = "Please Try Again Later"
let something_went_wrong = "Something Went Wrong"
//let sAlertEnterTempName = NSLocalizedString("Enter Template Name", comment: "enter template name")
//let sAlertHistoryNotFound = NSLocalizedString("You have no search history", comment: "History Data Not Found ERROR")

// CORE-DATA ENTITY NAME //

// KEY VALUES //
let Kdefault = UserDefaults.standard
let KDeviceToken = "deviceToken"

let KUserId = "UserId"
let KUserName = "UserName"
let KUserEmail = "UserEmail"
let KUserMobile = "UserMobile"
let KUserFname = "UserFnam"
let KUserSname = "UserSname"
let KUserPassword = "UserPassword"
let KUserData = "UserData"
let KBadgeCount = "BadgeCount"
let KUserType = "UserType"
let KBUserProfileStatus = "BUserProfileStatus"
let KCUserProfileStatus = "CUserProfileStatus"

let KLogin = "login_status"

//KEY Business Info:
let Buser_id = "user_id"
let Bbusiness_name = "bbusiness_name"
let Baddress_1 = "baddress_1"
let Baddress_2 = "baddress_2"
let Bstate = "bstate"
let Bcity = "bcity"
let Bphone_no = "bphone_no"
let Blatitude = "blatitude"
let Blongitude = "blongitude"
let Bcontact_name = "bcontact_name"
let Bemail = "bemail"
let Bphone_no_1 = "bphone_no_1"
let Bposition = "bposition"
let Blicense_no = "blicense_no"
let Bexpiry_date = "bexpiry_date"
let Btype = "btype"
let Bimage = "bimage"
let Bpostal_code = "bpostal_code"
let BProfileCreated = "ProfileCreated"

//KEY GIG Info:
let Ggig_title = "ggig_title"
let Gtype = "gtype"
let Ghourly_pay = "ghourly_pay"
let Gstart_date = "gstart_date"
let Gend_date = "gend_date"
let Gstart_time = "gstart_time"
let Gend_time = "gend_time"
let Gdescription = "gdescription"
let Gaddress_1 = "gaddress_1"
let Gaddress_2 = "gaddress_2"
let Gstate = "gstate"
let Gcity = "gcity"
let Gpostal_code = "gpostal_code"
let Glatitude = "glatitude"
let Glongitude = "glongitude"
let Gcandidate_invite = "gcandidate_invite"
let Gmiles = "gmiles"
let GIGCreated = "GIGCreated"


//KEY BadgeHolder Profile Info:
let Pfirst_name = "pfirst_name"
let Plast_name = "plast_name"
let Pphone_no = "pphone_no"
let Ppaypal_email = "ppaypal_email"
let Pemail = "pemail"
let Pssn_ein = "pssn_ein"
let Paddress_1 = "paddress_1"
let Paddress_2 = "paddress_2"
let Ppostal_code = "ppostal_code"
let Platitude = "platitude"
let Plongitude = "plongitude"
let Pexpiry_date = "pexpiry_date"
let Plicense_no = "plicense_no"
let Pimage = "pimage"
let PBadgeProfileCreated = "BadgeProfileCreated"

//KEY BankInfo:
let BNbank_name  = "bnbank_name"
let BNaccount_name = "bnaccount_name"
let BNaccount_no = "bnaccount_no"
let BNaddress_1 = "bnaddress_1"
let BNaddress_2 = "bnaddress_2"
let BNcity = "bncity"
let BNpostal_code = "bnpostal_code"
let BNphone_no = "bnphone_no"
let BNrouting_no = "bnrouting_no"
let BNCreated = "BNCreated"

// JSON-KEY
func logoutUser(viewController : UIViewController) {
    //UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    //UserDefaults.standard.synchronize()
//    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//    let VC = mainStoryboard.instantiateViewController(withIdentifier: sLoginScreenRootId)
//    UIApplication.shared.keyWindow?.rootViewController = VC
//    viewController.navigationController?.popToRootViewController(animated: true)
    
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let VC = mainStoryboard.instantiateViewController(withIdentifier: sLoginScreenRootId) as! UINavigationController
    UIApplication.shared.keyWindow?.rootViewController = VC
    UIApplication.shared.keyWindow?.makeKeyAndVisible()
    
}


//For BaseUrl
let KBaseUrl = "https://harvesthive.tecocraft.com/api"

//For Drawer
let KLblSelectedTextColor = UIColor.white
let KLblDeselectedTextColor = UIColor.init(white: 1.0, alpha: 0.4)
let KDrawerBackgroundColor = UIColor.blue

//For Navigationbar
let KNavigationbarBackColor = UIColor.blue

//For ViewController
let KViewControllerBackColor = UIColor.blue

let TOKEN_NAME = "FCMToken"
let KeychainUdid = "DeviceUdid"
let Deviceudid = "Deviceudid"
let NotificationDefault = "NotifyData"

let KAmount : Float = 100.00
//rgb(2,27,120)

let KViewBackColor = UIColor.init(red: 25.0/255.0, green: 107.0/255.0, blue: 191.0/255.0, alpha: 1)




