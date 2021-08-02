//
//  UIButton+Round.swift
//  DoctorServiceUser
//
//  Created by mac on 5/10/19.
//  Copyright © 2019 Infograins. All rights reserved.
//


import UIKit

@IBDesignable class RoundButton : UIButton
{
    @IBInspectable var clipToBound: Bool = false {
        didSet {
            self.clipsToBounds = clipsToBounds
        }
    }
    
    @IBInspectable var leftAndRightSideRound: Bool = false {
        didSet {
            self.layer.cornerRadius = bounds.size.height/2
        }
    }
    
    @IBInspectable var topAndBottomSideRound: Bool = false {
        didSet {
            self.layer.cornerRadius = bounds.size.width/2
        }
    }
    
    @IBInspectable var onlytopSideRound: Bool = false {
        didSet {
            self.layer.cornerRadius = bounds.size.width/2
            
            if #available(iOS 11.0, *) {
                self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
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
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

//Button indicator
@IBInspectable var indicatorColor : UIColor = .lightGray

   var originalButtonText: String?
   var activityIndicator: UIActivityIndicatorView!

   func showLoading() {
       originalButtonText = self.titleLabel?.text
       self.setTitle("", for: .normal)

       if (activityIndicator == nil) {
           activityIndicator = createActivityIndicator()
       }

       showSpinning()
   }

   func hideLoading() {
       DispatchQueue.main.async(execute: {
           self.setTitle(self.originalButtonText, for: .normal)
           self.activityIndicator.stopAnimating()
       })
   }

   private func createActivityIndicator() -> UIActivityIndicatorView {
       let activityIndicator = UIActivityIndicatorView()
       activityIndicator.hidesWhenStopped = true
       activityIndicator.color = indicatorColor
       return activityIndicator
   }

   private func showSpinning() {
       activityIndicator.translatesAutoresizingMaskIntoConstraints = false
       self.addSubview(activityIndicator)
       centerActivityIndicatorInButton()
       activityIndicator.startAnimating()
   }

private func centerActivityIndicatorInButton() {
           let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
           self.addConstraint(xCenterConstraint)

           let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
           self.addConstraint(yCenterConstraint)
       }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


public extension UIButton
{
    
    func alignTextUnderImage(spacing: CGFloat = 6.0)
    {
        if let image = self.imageView?.image
        {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font ?? "nil"])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
    
    func underline(text:String?) {
        guard let text = text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
