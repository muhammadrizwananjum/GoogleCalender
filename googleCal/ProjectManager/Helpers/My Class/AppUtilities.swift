//
//  AppUtilities.swift
//  Laundry
//
//  Created by cears infotech on 7/18/16.
//  Copyright © 2016 Siddharth Vora. All rights reserved.
//

import UIKit


class AppUtilities: NSObject {
    
    var bgView = UIVisualEffectView()
    let activityIndicator = UIActivityIndicatorView()

    
    
    class var sharedInstance :AppUtilities {
        struct Singleton {
            static let instance = AppUtilities()
        }
        return Singleton.instance
    }

   
    /*========================================================
     * function Name: ValidatePassword
     * function Purpose: check reenter password is match with above password
     * function Parameters: var strPassword:NSString,var strConfirmPassword:NSString
     * function ReturnType: nil
     * function Description: check reenter password is match with above password
     *=====================================================*/
    
    class func ValidatePassword(strPassword:NSString,strConfirmPassword:NSString) ->Bool
    {
        return  strPassword.isEqual(to: strConfirmPassword as String) as Bool
    }

    /*========================================================
     * function Name: isiPad
     * function Purpose: check device is ipad or iphone
     * function Parameters: nil
     * function ReturnType: bool
     * function Description: check device is ipad or iphone
     *=====================================================*/
    
    class func isiPad()->Bool
    {
        return (UIDevice.current.userInterfaceIdiom == .pad)
    }
    
    /*========================================================
     * function Name: increaseFontSizeOfButtonForIpad
     * function Purpose: increaseFontSizeOfButtonForIpad
     * function Parameters: var button:UIButton?
     * function ReturnType: nil
     * function Description: increaseFontSizeOfButtonForIpad
     *=====================================================*/
    
    class func increaseFontSizeOfButtonForIpad( button:UIButton?)
    {
        //button?.titleLabel?.font = UIFont(name: FONT_NAME, size: 18.0)
    }

    /*========================================================
     * function Name: increaseFontSizeOfTextFieldForIpad
     * function Purpose: increaseFontSizeOfTextFieldForIpad
     * function Parameters: var button:UIButton?
     * function ReturnType: nil
     * function Description: increaseFontSizeOfTextFieldForIpad
     *=====================================================*/
    
    class func textFieldUtility( textField:UITextField?)
    {
        if(AppUtilities.isiPad())
        {
            textField?.layer.borderWidth = 1.0
            textField?.layer.cornerRadius = 7.0
            //textField?.font = UIFont.systemFontOfSize(18)
        }
        else
        {
            textField?.layer.borderWidth = 1
            textField?.layer.cornerRadius = 5.0
        }
        textField?.layer.borderColor = UIColor(red: 194/255, green: 194/255, blue: 194/255, alpha: 1.0).cgColor
        textField?.contentVerticalAlignment = UIControlContentVerticalAlignment.center
    }
    
    /*========================================================
     * function Name: increaseFontSizeOfLabelForIpad
     * function Purpose: increaseFontSizeOfLabelForIpad
     * function Parameters: var button:UIButton?
     * function ReturnType: nil
     * function Description: increaseFontSizeOfLabelForIpad
     *=====================================================*/
    
//    class func increaseFontSizeOfLabelForIpad(label:UILabel?, bold:Bool)
//    {
//        if(bold)
//        {
//            label?.font = UIFont(name: BOLD_FONT_NAME ,size: 20.0)
//        }
//        else
//        {
//            label?.font = UIFont(name: FONT_NAME ,size: 12.0)
//        }
//    }
    
    class func drawRedBorderToTextView(txtField:UITextView, cornerRadius:CGFloat, borderRadius:CGFloat)
    {
        txtField.layer.borderWidth=borderRadius
        txtField.layer.cornerRadius=cornerRadius
        txtField.layer.borderColor=UIColor.red.cgColor
        txtField.text=""
    }
    
  
    
    
    /*========================================================
     * function Name: getLength
     * function Purpose: To get length of mobile number field
     * function Parameters: mobileNo: NSString
     * function ReturnType: Int
     *=======================================================*/
    
    class func getLength( mobileNo: NSString) -> Int{
        
        var mobileNo = mobileNo
        mobileNo = mobileNo.replacingOccurrences(of: "(", with: "") as NSString
        mobileNo = mobileNo.replacingOccurrences(of: ")", with: "") as NSString
        mobileNo = mobileNo.replacingOccurrences(of: " ", with: "") as NSString
        mobileNo = mobileNo.replacingOccurrences(of: "-", with: "") as NSString
        mobileNo = mobileNo.replacingOccurrences(of: "+", with: "") as NSString
        let length = mobileNo.length
        return length
    }

    /*========================================================
     * function Name: isBlankSpace
     * function Purpose: To check string contains only whitespace or not
     * function Parameters: txtString:String)
     * function ReturnType: bool
     *=======================================================*/
    
    class func isBlankSpace( txtString:String)->Bool
    {
        let whiteSpace : CharacterSet = CharacterSet.whitespaces
        let trimText : NSString = txtString.trimmingCharacters(in: whiteSpace) as NSString
        if(trimText.length == 0)
        {
            return true
        }
        return false
    }
    
    /*========================================================
     * function Name: trimText
     * function Purpose: To trim space of string
     * function Parameters:txtString:String
     * function ReturnType: NSString
     *=======================================================*/
    
    class func trimText( txtString:String)-> NSString
    {
        let whiteSpace : CharacterSet = CharacterSet.whitespaces
        let trimPet : NSString = txtString.trimmingCharacters(in: whiteSpace) as NSString
        return trimPet
    }
    
    /*========================================================
     * function Name: setCircleImage
     * function Purpose: to set button corner
     * function Parameters: btn: UIButton
     * function ReturnType: nil
     *=======================================================*/
        class func setCircleImage(btn: AnyObject) {
            btn.layer.cornerRadius = btn.frame.size.height / 2
            //btn.layer.masksToBounds = true
        }

    
    /*===================================================
     * function Name : setUserDefaults
     * function Params: key:NSString ,value:NSString
     * fuction  Return type: nil
     * function Purpose: to set user default value
     ===================================================*/
    
    class func setUserDefaults(key:NSString ,value:NSString)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key as String)
        userDefaults.synchronize()
    }
    
    class func setUserDefaultsBool(key:NSString ,value:Bool)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key as String)
        userDefaults.synchronize()
    }

    class func resignTextField(textField:UITextField)
    {
        if(textField.isFirstResponder)
        {
            textField.resignFirstResponder()
        }
    }
    
    class func resignTextView(textField:UITextView)
    {
        if(textField.isFirstResponder)
        {
            textField.resignFirstResponder()
        }
    }
    
    class func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    // check internet connectivity
//    class func isConnectedToNetwork() -> Bool {
//        
//        let reachability = Reachability.forInternetConnection()
//        let status : NetworkStatus =  reachability!.currentReachabilityStatus()
//        if status == NotReachable
//        {
//            return false
//        }
//        else
//        {
//            return true
//        }
//    }

    class func paddingTextField(textField:UITextField!, size : CGFloat)
    {
        let paddingView:UIView = UIView(frame: CGRect(x:0, y:0,width: size,height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
    }
    
//    class func drawRedBorderToTextfield(txtField:AnyObject, cornerRadius:CGFloat, borderRadius:CGFloat)
//    {
//        if #available(iOS 8.0, *) {
//            txtField.layer.borderWidth=borderRadius
//            txtField.layer.cornerRadius=cornerRadius
//            txtField.layer.borderColor=UIColor.red.cgColor
//
//        } else {
//            // Fallback on earlier versions
//        }
//            }
    
//    class func drawClearBorderToTextfield(txtField:AnyObject,cornerRadius:CGFloat, borderRadius:CGFloat)
//    {
//        if #available(iOS 8.0, *) {
//        txtField.layer.borderWidth=borderRadius
//        txtField.layer.cornerRadius=cornerRadius
//        txtField.layer.borderColor=UIColor.clear.cgColor
//        }
//    }
    
    class func bottomBorder(textField :AnyObject)
    {
        if #available(iOS 8.0, *) {
        let bottomLine = CALayer()
            bottomLine.frame = CGRect(x:0.0, y:textField.frame.height - 1, width:textField.frame.width, height : 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textField.layer.addSublayer(bottomLine)
        }
    }
    
    class func bottomBorderColor(textField :AnyObject)
    {
        if #available(iOS 8.0, *) {
        let bottomLine = CALayer()
            bottomLine.frame = CGRect(x:0.0,y: textField.frame.height - 1, width:textField.frame.width,height: 1.0)
        bottomLine.backgroundColor = UIColor(red: 53/255, green: 176/255, blue: 178/255, alpha: 1.0).cgColor
        textField.layer.addSublayer(bottomLine)
        }
    }
    
    class func setPlaceholder (textFiled : UITextField , str : String)
    {
        textFiled.attributedPlaceholder = NSAttributedString(string:str, attributes:[NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
    class func setPlaceholderGray (textFiled : UITextField , str : String)
    {
        textFiled.attributedPlaceholder = NSAttributedString(string:str,
                                                             attributes:[NSAttributedStringKey.foregroundColor: UIColor.gray])
    }
    
    class func showAlert(title : NSString, msg : NSString) //siddaku
    {
        let alert = UIAlertView(title: title as String, message: msg as String, delegate: nil, cancelButtonTitle: "OK")
        DispatchQueue.main.async {
            alert.show()
        }
    }
    
    
    class func imageResize(img: UIImage, newSize: CGSize) -> UIImage {
        
        let scale: CGFloat = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        img.draw(in: CGRect(x:0, y:0,width: newSize.width, height:newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

    

    

    
    func PlaceHolderPadding(myTextField : UITextField){
        myTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
    }
    
    
    func CornerRadiusText(anyObj : AnyObject)  {
        anyObj.layer.cornerRadius = 5.0
    }
    
//    class func hideLoader()
//    {
//       
//        //DispatchQueue.main.sync() {
//        SwiftLoader.hide()
//       // }
//    
//    }
    
    
    // API Methods
    class func dataTask(request: NSMutableURLRequest, method: String,params:NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        request.httpMethod = method
        request.httpBody = params.data(using: String.Encoding.utf8.rawValue)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject?)
                } else {
                    completion(false, json as AnyObject?)
                }
            }
            }.resume()
    }
    
    class func post(request: NSMutableURLRequest,params: NSString , completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", params: params, completion: completion)
        
    }
    
    class func put(request: NSMutableURLRequest,params:NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", params: params, completion: completion)
        
    }
    
    class func get(request: NSMutableURLRequest,params:NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        print(request)
        
        dataTask(request: request, method: "GET", params: params, completion: completion)
        
    }
    
    
   class func dataTaskWithImage(request: NSMutableURLRequest, method: String, params:NSMutableDictionary, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject?)
                } else {
                    completion(false, json as AnyObject?)
                }
            }
        }.resume()
    }
    
    class func postwithImage(request: NSMutableURLRequest,params:NSMutableDictionary, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTaskWithImage(request: request, method: "POST", params: params, completion: completion)
        
    }
    
    class func removeDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
                
            }
            else {
                encountered.insert(value)
                result.append(value)
            }
        }
        return result
    }
    
    class func getTodayDateString() -> String{
        
       let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let CurrentDateString = formatter.string(from: Date())
        print(CurrentDateString)   // "4:44 PM on June 23, 2016\n"
        
        return CurrentDateString
    }
    
    class func getCurrentTimeString() -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"     //"hh:mm:ss a"
        //formatter.amSymbol = "am"
        //formatter.pmSymbol = "pm"
        
        let CurrentTimeString = formatter.string(from: Date())
        print(CurrentTimeString)   // "4:44 PM on June 23, 2016\n"
        
        return CurrentTimeString
        
    }
    
    
    class func pleaseTryLaterMsgToast(){
        let app = UIApplication.shared
        app.keyWindow?.makeToast(sAlertPlzTryLater, duration: 2.0, position: .bottom)
    }
    
    
    //DASEDLINE OUTER
    class func dashedlineView(button: UIButton){
        let rect = button.bounds
        let layer = CAShapeLayer.init()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 4)
        layer.path = path.cgPath;
        layer.strokeColor = UIColor.white.cgColor;
        layer.lineDashPattern = [3,3];
        layer.backgroundColor = UIColor.clear.cgColor;
        layer.fillColor = UIColor.clear.cgColor;
        button.layer.addSublayer(layer);
    }
    
    
    
}



func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}



class MyTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 45);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func reloadtbl(sec:Int){
        if let tbl = self.view.viewWithTag(sec) as? UITableView{
            tbl.reloadData()
        }
    }
    func SetUsername(){
        if let userName = self.view.viewWithTag(999) as? UILabel {
            let fname = Kdefault.value(forKey: KUserFname) as! String
            let sname = Kdefault.value(forKey: KUserSname) as! String
            userName.font = UIFont.systemFont(ofSize: ((SCREEN_WIDTH * 13.0) / 320.0))
            userName.text = "\(fname.uppercased()) \(sname.uppercased()) (\(Kdefault.value(forKey: KUserName) as! String))"
        }
        
        if let Privacy = self.view.viewWithTag(888) as? UILabel {
            Privacy.font = UIFont.systemFont(ofSize: ((SCREEN_WIDTH * 8.0) / 320.0))
            Privacy.attributedText = attributedText(str: Privacy.text!)
            Privacy.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.OurWebClick(sender:)))
            tap.numberOfTapsRequired = 1
            Privacy.addGestureRecognizer(tap)
        }
        
    }
    
    @objc func OurWebClick(sender: UITapGestureRecognizer!) {
        guard let url = URL(string: "https://www.facebook.com/veloeyeapp/") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    func attributedText(str: String) -> NSAttributedString {
        let strIs = str.replacingOccurrences(of: "?", with: "•")
        let string = strIs as NSString
        
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: ((SCREEN_WIDTH * 8.0) / 320.0))
                ])
    
        let boldFontAttribute = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: ((SCREEN_WIDTH * 9.0) / 320.0))]
        let colorAttribute = [NSAttributedStringKey.foregroundColor: UIColor.init(rgb: 0xFF4200)]
        //let linkAttribute = [NSAttributedStringKey.link:URL(string: "https://www.facebook.com/veloeyeapp/")!]
            // Part of string to be bold
            attributedString.addAttributes(boldFontAttribute, range: string.range(of: "here"))
            //attributedString.addAttributes(linkAttribute, range: string.range(of: "here"))
            attributedString.addAttributes(colorAttribute, range: string.range(of: "here"))
            // 4
            return attributedString
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

