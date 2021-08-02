//
//  DoctorServiceTextFild.swift
//  DoctorServicesVendor
//
//  Created by mac on 16/10/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

class PueoTextFild: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    @IBInspectable var cornerRadiuss: CGFloat = 0.0  {
        didSet {
            layer.cornerRadius = cornerRadiuss
        }
    }
    @IBInspectable var shadowColor:UIColor = .clear
        {
        didSet{
            self.layer.masksToBounds = false
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
            self.layer.shadowRadius = 1
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}



@IBDesignable class TfSetLeftRightImage : UITextField

{
    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }


    @IBInspectable var leftSideImage:UIImage = UIImage() {
        
        didSet {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            imageView.image = leftSideImage
            leftView = imageView
            leftViewMode = .always
        
        }
    }
    
    @IBInspectable var rightSideImage:UIImage = UIImage() {
        
        didSet {
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            
            imageView.image = rightSideImage
            rightView = imageView
            //rightView = UIImageView.init(image: rightSideImage)
            rightViewMode = .always
            
        }
    }
    

    
    @IBInspectable var RightPadding: CGFloat = 0
    @IBInspectable var LeftPadding: CGFloat = 0
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += LeftPadding
        return textRect
    }
    
    // Provides right padding for image
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= RightPadding
        return textRect
    }
    
    @IBInspectable var clipToBound: Bool = false {
        didSet {
            self.clipsToBounds = clipsToBounds
        }
    }
    
    @IBInspectable var maskToBounds : Bool = false  {
        didSet {
            layer.masksToBounds = maskToBounds
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadiuss: CGFloat = 0.0  {
        didSet {
            layer.cornerRadius = cornerRadiuss
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}

