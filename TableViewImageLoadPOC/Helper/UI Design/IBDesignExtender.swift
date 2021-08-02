//
//  ButtonExtender.swift
//  IBButtonExtender
//
//  Created by Ashish on 08/08/15.
//  Copyright (c) 2015 Ashish. All rights reserved.
//

import UIKit
import QuartzCore
 

//@IBDesignable public class IBView: UIView {
//
//    @IBInspectable public var borderColor: UIColor = UIColor.clear {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
//
//    @IBInspectable public var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//
//    @IBInspectable public override var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//
//    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
//        didSet {
//            layer.shadowColor = shadowColor.cgColor
//        }
//    }
//
//    @IBInspectable public var shadowRadius: CGFloat = 0 {
//        didSet {
//            layer.shadowRadius = shadowRadius
//        }
//    }
//
//    @IBInspectable public var shadowOpacity: CGFloat = 0 {
//        didSet {
//            layer.shadowOpacity = Float(shadowOpacity)
//        }
//    }
//
//    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
//        didSet {
//            layer.shadowOffset.height = shadowOffsetY
//        }
//    }
//    /*
//     // Only override draw() if you perform custom drawing.
//     // An empty implementation adversely affects performance during animation.
//     override func draw(_ rect: CGRect) {
//     // Drawing code
//     }
//     */
//    @IBInspectable override var shadow: Bool {
//        get {
//            return layer.shadowOpacity > 0.0
//        }
//        set {
//            if newValue == true {
//                self.addShadow()
//            }
//        }
//    }
//    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
//               shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
//               shadowOpacity: Float = 0.4,
//               shadowRadius: CGFloat = 3.0) {
//        layer.shadowColor = shadowColor
//        layer.shadowOffset = shadowOffset
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowRadius = shadowRadius
//    }
//}

//@IBDesignable public class IBGradientView: IBView {
//    
//    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
//    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
//    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
//    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
//    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
//    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
//    
//    override public class var layerClass: AnyClass { return CAGradientLayer.self }
//    
//    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
//    
//    func updatePoints() {
//        if horizontalMode {
//            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
//            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
//        } else {
//            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
//            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
//        }
//    }
//    func updateLocations() {
//        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
//    }
//    func updateColors() {
//        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
//    }
//    
//    override public func layoutSubviews() {
//        super.layoutSubviews()
//        updatePoints()
//        updateLocations()
//        updateColors()
//    }
//}

//@IBDesignable public class IBStackView: UIStackView {
//
//    @IBInspectable public var borderColor: UIColor = UIColor.clear {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
//
//    @IBInspectable public var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//
//    @IBInspectable public override var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//
//    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
//        didSet {
//            layer.shadowColor = shadowColor.cgColor
//        }
//    }
//
//    @IBInspectable public var shadowRadius: CGFloat = 0 {
//        didSet {
//            layer.shadowRadius = shadowRadius
//        }
//    }
//
//    @IBInspectable public var shadowOpacity: CGFloat = 0 {
//        didSet {
//            layer.shadowOpacity = Float(shadowOpacity)
//        }
//    }
//
//    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
//        didSet {
//            layer.shadowOffset.height = shadowOffsetY
//        }
//    }
//    /*
//     // Only override draw() if you perform custom drawing.
//     // An empty implementation adversely affects performance during animation.
//     override func draw(_ rect: CGRect) {
//     // Drawing code
//     }
//     */
//
//}



@IBDesignable public class IBImageView: UIImageView {
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
}

@IBDesignable public class IBLabel: UILabel {
    @IBInspectable var topInset: CGFloat = 5.0
       @IBInspectable var bottomInset: CGFloat = 5.0
       @IBInspectable var leftInset: CGFloat = 7.0
       @IBInspectable var rightInset: CGFloat = 7.0
  
    override public func drawText(in rect: CGRect) {
          let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
      }

       func intrinsicContentSize() -> CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
          intrinsicSuperViewContentSize.height += topInset + bottomInset
          intrinsicSuperViewContentSize.width += leftInset + rightInset
          return intrinsicSuperViewContentSize
      }
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var lineHeight: CGFloat = 1.5 {
        didSet {
            let font = UIFont(name: self.font.fontName, size: self.font.pointSize)
            guard let text = self.text else { return }
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineHeight
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            attributedString.addAttribute(NSAttributedString.Key.font, value: font!, range: NSMakeRange(0, attributedString.length))
            
            self.attributedText = attributedString
        }
    }
    
}

@IBDesignable public class IBTabBar: UITabBar {
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

//@IBDesignable class IBTabBarController: UITabBarController {
//
//    @IBInspectable var normalTint: UIColor = UIColor.clear {
//        didSet {
//            UITabBar.appearance().tintColor = normalTint
//            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: normalTint], for: UIControl.State())
//        }
//    }
//
//    @IBInspectable var selectedTint: UIColor = UIColor.clear {
//        override  didSet {
//            UITabBar.appearance().tintColor = selectedTint
//            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedTint], for:UIControl.State.selected)
//        }
//    }
//
//    @IBInspectable var fontName: String = "" {
//        didSet {
//            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: normalTint, NSAttributedString.Key.font: UIFont(name: fontName, size: 11)!], for: UIControl.State())
//        }
//    }
//
//    @IBInspectable var firstSelectedImage: UIImage? {
//        didSet {
//            if let image = firstSelectedImage {
//                var tabBarItems = self.tabBar.items
//                tabBarItems![0].selectedImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
//            }
//        }
//    }
//
//    @IBInspectable var secondSelectedImage: UIImage? {
//        didSet {
//            if let image = secondSelectedImage {
//                let tabBarItems = self.tabBar.items
//                tabBarItems?[1].selectedImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
//            }
//        }
//    }
//
//    @IBInspectable var thirdSelectedImage: UIImage? {
//        didSet {
//            if let image = thirdSelectedImage {
//                let tabBarItems = self.tabBar.items
//                tabBarItems?[2].selectedImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
//            }
//        }
//    }
//
//    @IBInspectable var fourthSelectedImage: UIImage? {
//        didSet {
//            if let image = fourthSelectedImage {
//                let tabBarItems = self.tabBar.items
//                tabBarItems?[3].selectedImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
//            }
//        }
//    }
//
//    @IBInspectable var fifthSelectedImage: UIImage? {
//        didSet {
//            if let image = fifthSelectedImage {
//                let tabBarItems = self.tabBar.items
//                tabBarItems?[4].selectedImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        for item in self.tabBar.items!
//        {
//            if let image = item.image {
//                item.image = image.imageWithColor(tintColor: self.normalTint).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//            }
//        }
//    }
//}

@IBDesignable public class IBTextField: UITextField {
    
    @IBInspectable public var placeholderColor: UIColor = UIColor.clear {
        didSet {
            guard let placeholder = placeholder else { return }
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
            layoutSubviews()
            
        }
    }
    
    @IBInspectable public var sidePadding: CGFloat = 0 {
        didSet {
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: sidePadding, height: sidePadding))
            
            leftViewMode = UITextField.ViewMode.always
            leftView = padding
            
            rightViewMode = UITextField.ViewMode.always
            rightView = padding
        }
    }
    
    @IBInspectable public var leftPadding: CGFloat = 0 {
        didSet {
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 0))
            
            leftViewMode = UITextField.ViewMode.always
            leftView = padding
        }
    }
    
    @IBInspectable public var rightPadding: CGFloat = 0 {
        didSet {
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: 0))
            
            rightViewMode = UITextField.ViewMode.always
            rightView = padding
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var lineHeight: CGFloat = 1.5 {
        didSet {
            let font = UIFont(name: self.font!.fontName, size: self.font!.pointSize)
            guard let text = self.text else { return }
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineHeight
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedString.addAttribute(NSAttributedString.Key.font, value: font!, range: NSRange(location: 0, length: attributedString.length))
            
            self.attributedText = attributedString
        }
    }
    
}
 
//@IBDesignable public class IBTextView: UITextView {
//
//    @IBInspectable public var borderColor: UIColor = UIColor.clear {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
//
//    @IBInspectable public var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//
//    @IBInspectable public var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//
//    @IBInspectable public var lineHeight: CGFloat = 1.5 {
//        didSet {
//            let font = UIFont(name: self.font!.fontName, size: self.font!.pointSize)
//            guard let text = self.text else { return }
//
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineSpacing = lineHeight
//
//            let attributedString = NSMutableAttributedString(string: text)
//            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
//            attributedString.addAttribute(NSAttributedString.Key.font, value: font!, range: NSRange(location: 0, length: attributedString.length))
//
//            self.attributedText = attributedString
//        }
//    }
//    override public var text: String! { // Ensures that the placeholder text is never returned as the field's text
//            get {
//                if showingPlaceholder {
//                    return "" // When showing the placeholder, there's no real text to return
//                } else { return super.text }
//            }
//            set { super.text = newValue }
//        }
//    @IBInspectable var plaoverride ceholderText: String = ""
//        @IBInspectable var placeholderTextColor: UIColor = UIColor(red: 0.78, green: 0.78, blue: 0.80, alpha: 1.0) // Standard iOS placeholder color (#C7C7CD). See https://stackoverflow.com/questions/31057746/whats-the-default-color-for-placeholder-text-in-uitextfield
//        private var showingPlaceholder: Bool = true // Keeps track of whether the field is currently showing a placeholder
//
//    override public func didMoveToWindow() {
//            super.didMoveToWindow()
//            if text.isEmpty {
//                showPlaceholderText() // Load up the placeholder text when first appearing, but not if coming back to a view where text was already entered
//            }
//        }
//
//    override public func becomeFirstResponder() -> Bool {
//            // If the current text is the placeholder, remove it
//            if showingPlaceholder {
//                text = nil
//                textColor = nil // Put the text back to the default, unmodified color
//                showingPlaceholder = false
//            }
//            return super.becomeFirstResponder()
//        }
//
//    override public func resignFirstResponder() -> Bool {
//            // If there's no text, put the placeholder back
//            if text.isEmpty {
//                showPlaceholderText()
//            }
//        return super.reoverride signFirstResponder()
//        }
//
//        private func showPlaceholderText() {
//            showingPlaceholder = true
//            textColor = placeholderTextColor
//            text = placeholderText
//        }
//    }


extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 0, y: self.size.height)
        context!.scaleBy(x: 1.0, y: -1.0);
        context!.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.clip(to: rect, mask: self.cgImage!)
        tintColor.setFill()
        context!.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
