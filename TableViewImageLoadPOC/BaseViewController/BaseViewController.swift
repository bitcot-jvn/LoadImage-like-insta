//
//  BaseViewController.swift
//  MX Diamonds

//  Created by mac on 08/03/19.
//  Copyright © 2019 Chandan. All rights reserved.
//

import UIKit
import Alamofire
//import IQKeyboardManagerSwift
import AVFoundation
//import SideMenu


class BaseViewController: UIViewController,UITextViewDelegate {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.setupSideMenu()
//        UINavigationController().setupNavigationPreference()
////        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
////        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done".localized
        if self.navigationController != nil{
            SceneClass.mySceneDelegate?.navController = self.navigationController!
        }
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        IQKeyboardManager.shared.enable = true
//        IQKeyboardManager.shared.enableAutoToolbar = true
//        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
       
    }
    
   
    
    //get video size in 
    func sizePerMB(url: URL?) -> Double {
        guard let filePath = url?.path else {
            return 0.0
        }
        do {
            let attribute = try FileManager.default.attributesOfItem(atPath: filePath)
            if let size = attribute[FileAttributeKey.size] as? NSNumber {
                return size.doubleValue / 1000000.0
            }
        } catch {
            print("Error: \(error)")
        }
        return 0.0
    }

    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.15, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
    
    func numberToDateConvert(_ dateTime: Int, formate : String) -> String{
        let dateFormatter = DateFormatter()
        let timeInterval = Double(dateTime)
        let myNSDate = Date(timeIntervalSince1970: timeInterval) //Says its "Oct 29, 52338 at 6:00 AM"
        // Convert Date to String
        dateFormatter.dateFormat = formate
        return dateFormatter.string(from: myNSDate)
       
        
            
    }
    
    func convertDateFormater(_ date: String, serverFormate:String, targetFormate:String) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = serverFormate
            let date = dateFormatter.date(from: date)
        if targetFormate == "yyyy-MM-dd"{
            dateFormatter.dateFormat  = targetFormate
        }else{
            dateFormatter.dateFormat = "MM-dd-yyyy"
        }
            //targetFormate
            return  dateFormatter.string(from: date ?? Date())

        }
    
    
    func convertDateFormaterNew(_ date: String, serverFormate:String, targetFormate:String) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = serverFormate
            let date = dateFormatter.date(from: date)
            dateFormatter.dateFormat = targetFormate
            //targetFormate
            return  dateFormatter.string(from: date ?? Date())

        }
    
    func resetViewForLanguage() {
        let windows = UIApplication.shared.windows as [UIWindow]
        for window in windows {
            let subviews = window.subviews as [UIView]
            for v in subviews {
                v.removeFromSuperview()
                window.addSubview(v)
            }
        }
    }
    
    
    func generateBarcode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        //CIQRCodeGenerator : QRCode // CICode128BarcodeGenerator : bar code
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    
    func generateThumbnail(path: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: path, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
    
    func containsOnlyNumbers(_ candidate: String) -> Bool {
        let ValidationExpression = "-?\\d+(.\\d+)?"
        return NSPredicate(format: "SELF MATCHES %@", ValidationExpression).evaluate(with: candidate)
    }
    
    func exponentialNumberToDoubleConvert(_ number: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20

        guard let text = numberFormatter.string(for: number) else {
            // ...
            return "0.0"
        }
        print(text)
        return text
    }
    
    func showAnnouncment(withMessage message: String, closer:(()-> Void)? = nil){
        let alertController =   UIAlertController(title: Utils.AppName(), message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction!) in
            closer?()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setUnderLineText(text: String, lable: UILabel,str: String){
        lable.text = text
        lable.textColor =  UIColor.white
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: str)
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Poppins-Regular", size: 13.0)!, range: range1)
       // underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor("#FFFFFF"), range: range1)
        lable.attributedText = underlineAttriString
        lable.isUserInteractionEnabled = true
    }
    
    func ConfirmationYesAndNo(withMessage message: String,yesTitle: String, noTitle: String, closer:(()-> Void)? = nil){
        let alertController =   UIAlertController(title: Utils.AppName(), message: message, preferredStyle: .alert)
        let noAction = UIAlertAction(title: noTitle, style: .cancel, handler: nil)
        let yesAction = UIAlertAction(title: yesTitle, style: .default) { (action:UIAlertAction!) in
            closer?()
        }
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
//        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.present(alertController, animated: true, completion: nil)

    }
    
    
    //convert json formate
    func dicToJson(data:[[String : Any]]) -> String{
           var str = String()
           var myData = [String:Any]()
           myData["userIn"] = data
           let jsonData = try? JSONSerialization.data(withJSONObject: myData, options: .prettyPrinted)
           let decoded = try? JSONSerialization.jsonObject(with: jsonData!, options: [])
           if let dictFromJSON = decoded as? [String:AnyObject] {
               print(dictFromJSON)
               let vv = dictFromJSON["userIn"]
               let jsonData1 = try! JSONSerialization.data(withJSONObject: vv as Any, options: [])
               let decoded1 = String(data: jsonData1, encoding: .utf8)!
               str = decoded1
           }
           return str
       }
    
    func OptionForCameraANdGallery(withMessage message: String,cameraTitle: String, galleryTitle: String, cameraCloser:(()-> Void)? = nil, galleryCloser:(()-> Void)? = nil){
        let alertController =   UIAlertController(title: Utils.AppName(), message: message, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: cameraTitle, style: .default) { (action:UIAlertAction!) in
            cameraCloser?()
        }
        let galleryAction = UIAlertAction(title: galleryTitle, style: .default) { (action:UIAlertAction!) in
            galleryCloser?()
        }
        let cancel = UIAlertAction(title: "Cancel".localized, style: .cancel) { (action:UIAlertAction!) in
            
        }
        alertController.addAction(cameraAction)
        alertController.addAction(galleryAction)
        alertController.addAction(cancel)
        if ( UIUserInterfaceIdiom.pad == UIUserInterfaceIdiom.pad ){
            alertController.popoverPresentationController?.sourceView = self.view
        }
       
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func pushToStudentSidemenu(Str: String){
        let vc = MainClass.Home.instantiateViewController(withIdentifier: Str)
        vc.hidesBottomBarWhenPushed = true
        let transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popToStudentHome(){
        let transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
    }
    
    func OptionForCameraANdGalleryAndDocument(withMessage message: String,cameraTitle: String, galleryTitle: String,documentTitle: String, cameraCloser:(()-> Void)? = nil, galleryCloser:(()-> Void)? = nil, documnetCloser:(()-> Void)? = nil){
        let alertController =   UIAlertController(title: Utils.AppName(), message: message, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: cameraTitle, style: .default) { (action:UIAlertAction!) in
            cameraCloser?()
        }
        let galleryAction = UIAlertAction(title: galleryTitle, style: .default) { (action:UIAlertAction!) in
            galleryCloser?()
        }
        let documentAction = UIAlertAction(title: documentTitle, style: .default) { (action:UIAlertAction!) in
            documnetCloser?()
        }
        let cancel = UIAlertAction(title: "Cancel".localized, style: .cancel) { (action:UIAlertAction!) in
            
        }
        alertController.addAction(cameraAction)
        alertController.addAction(galleryAction)
        alertController.addAction(documentAction)
        alertController.addAction(cancel)
        if ( UIUserInterfaceIdiom.pad == UIUserInterfaceIdiom.pad ){
            alertController.popoverPresentationController?.sourceView = self.view
        }
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func hideNavigationBar(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func popController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func onlyCharacter(Str:String) -> Bool{
        let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: Str)
        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
        return alphabet
    }
    
    func setupBack(){
        let backBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .done, target: self, action: #selector(popController))
            //UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(popController))
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    func popToDesiredController(vc : AnyClass){
        for controller in (self.navigationController?.viewControllers ?? []) as Array {
            if controller.isKind(of: vc.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)//CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? UIImage()
    }
}


extension UINavigationController{
    func setupNavigationPreference(){
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
       if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
         popToViewController(vc, animated: animated)
       }
     }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension BaseViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
  func showServerErrorMessage(data: Any){
      self.showAnnouncment(withMessage:  String(describing: (data as AnyObject).userInfo[NSLocalizedDescriptionKey]!).replacingOccurrences(of: "}", with: "").components(separatedBy: "=").last! )
  }
    
    func utcToLocal(dateStr: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//2020-10-19 08:11:02
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: dateStr) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "MM-dd-yyyy • hh:mm a"//10-08-2020 | 11:47
            
            return dateFormatter.string(from: date)
        }
        return nil
    }
}


extension UITextField {

    func addInputViewDatePicker(target: Any, selector: Selector,datePicker:UIDatePicker) {
    let screenWidth = UIScreen.main.bounds.width
    let calendar = Calendar(identifier: .gregorian)
    //Add DatePicker as inputView
    var components = DateComponents()
    components.calendar = calendar
//    components.year = -18
    let currentDate = Date()
    datePicker.datePickerMode = .date
    datePicker.layer.masksToBounds = true
    let minDate = calendar.date(byAdding: components, to: currentDate)!
    datePicker.maximumDate = minDate + 18
    self.inputView = datePicker
    //Add Tool Bar as input AccessoryView
    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
    let doneBarButton = UIBarButtonItem(title: "Done", style: .done, target: target, action: selector)
    toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
    self.inputAccessoryView = toolBar
 }

    func addInputViewDatePickerWithoutLimit(target: Any, selector: Selector,datePicker:UIDatePicker) {
       let screenWidth = UIScreen.main.bounds.width
       //Add DatePicker as inputView
        datePicker.datePickerMode = .date
       datePicker.maximumDate = Date()
       self.inputView = datePicker
       //Add Tool Bar as input AccessoryView
       let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
       let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
       let doneBarButton = UIBarButtonItem(title: "Done", style: .done, target: target, action: selector)
       toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
       self.inputAccessoryView = toolBar
    }
    func addInputViewDatePickerWithoutLimit12(target: Any, selector: Selector,datePicker:UIDatePicker) {
       let screenWidth = UIScreen.main.bounds.width
       //Add DatePicker as inputView
        datePicker.datePickerMode = .date
       datePicker.minimumDate = Date()
       self.inputView = datePicker
       //Add Tool Bar as input AccessoryView
       let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
       let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
       let doneBarButton = UIBarButtonItem(title: "Done", style: .done, target: target, action: selector)
       toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
       self.inputAccessoryView = toolBar
    }
    
   @objc func cancelPressed() {
     self.resignFirstResponder()
   }
    
   
    
    
}


extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
    
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}

public extension UITextField {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func redborderAlert() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
    }
    func redborderAlertClear() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 0
    }
}


public extension UIView {
    func Vwshake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func redborderAlertForView() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func redborderAlertClearForView() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 0
    }
}

extension UILabel{
    func textColor(text1:String,text2:String) -> NSMutableAttributedString  {
        let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.white]
        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(red: 0 / 250, green: 213 / 250, blue: 8 / 250, alpha: 1)]
        let attributedString1 = NSMutableAttributedString(string:text1, attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:text2, attributes:attrs2)
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
   
    
    
    func addTrailing(with trailingText: String, moreText: String, moreTextFont: UIFont, moreTextColor: UIColor) {
        let readMoreText: String = trailingText + moreText
        let lengthForVisibleString: Int = 50
        let mutableString: String = self.text!
        let trimmedString: String? = (mutableString as NSString).replacingCharacters(in: NSRange(location: lengthForVisibleString, length: ((self.text?.count)! - lengthForVisibleString)), with: "")
        let readMoreLength: Int = (readMoreText.count)
        let trimmedForReadMore: String = (trimmedString! as NSString).replacingCharacters(in: NSRange(location: ((trimmedString?.count ?? 0) - readMoreLength), length: readMoreLength), with: "") + trailingText
        let answerAttributed = NSMutableAttributedString(string: trimmedForReadMore, attributes: [NSAttributedString.Key.font: self.font!])
        let readMoreAttributed = NSMutableAttributedString(string: moreText, attributes: [NSAttributedString.Key.font: moreTextFont, NSAttributedString.Key.foregroundColor: moreTextColor])
        answerAttributed.append(readMoreAttributed)
        self.attributedText = answerAttributed
    }

}


extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


extension Array where Element: Hashable {
    func uniqued() -> Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}



extension UIAlertController{
    func ConfirmationYesAndNo(withMessage message: String,yesTitle: String, noTitle: String, target: UIViewController, closer:(()-> Void)? = nil){
        let alertController =   UIAlertController(title: Utils.AppName(), message: message, preferredStyle: .alert)
        let noAction = UIAlertAction(title: noTitle, style: .cancel, handler: nil)
        let yesAction = UIAlertAction(title: yesTitle, style: .default) { (action:UIAlertAction!) in
            closer?()
        }
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
       target.present(alertController, animated: true, completion: nil)
        //self.present(alertController, animated: true, completion: nil)
//        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.present(alertController, animated: true, completion: nil)

    }
}

extension Formatter {
    static let date = DateFormatter()
}

extension Date {
    var localizedDescription: String { localizedDescription() }
    
    func localizedDescription(dateStyle: DateFormatter.Style = .medium,
                              timeStyle: DateFormatter.Style = .medium,
                              in timeZone : TimeZone = .current,
                              locale   : Locale = .current) -> String {
        Formatter.date.locale = locale
        Formatter.date.timeZone = timeZone
        Formatter.date.dateStyle = dateStyle
        Formatter.date.timeStyle = timeStyle
        return Formatter.date.string(from: self)
    }
    
    var fullDate: String   { localizedDescription(dateStyle: .full,   timeStyle: .none) }
    var longDate: String   { localizedDescription(dateStyle: .long,   timeStyle: .none) }
    var mediumDate: String { localizedDescription(dateStyle: .medium, timeStyle: .none) }
    var shortDate: String  { localizedDescription(dateStyle: .short,  timeStyle: .none) }
    
    var fullTime: String   { localizedDescription(dateStyle: .none,   timeStyle: .full) }
    var longTime: String   { localizedDescription(dateStyle: .none,   timeStyle: .long) }
    var mediumTime: String { localizedDescription(dateStyle: .none,   timeStyle: .medium) }
    var shortTime: String  { localizedDescription(dateStyle: .none,   timeStyle: .short) }
    
    var fullDateTime: String   { localizedDescription(dateStyle: .full,   timeStyle: .full) }
    var longDateTime: String   { localizedDescription(dateStyle: .long,   timeStyle: .long) }
    var mediumDateTime: String { localizedDescription(dateStyle: .medium, timeStyle: .medium) }
    var shortDateTime: String  { localizedDescription(dateStyle: .short,  timeStyle: .short) }
}
