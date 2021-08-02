//
//  Designable.swift
//  BinguUser
//
//  Created by User on 17/08/17.
//  Copyright © 2017 Ajayy. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class TextViewClass: UITextView{
    override func layoutSubviews() {
        
    }
    
    @IBInspectable var clipsToBound: Bool = false{
        didSet{
            self.clipsToBounds = clipsToBound
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

@IBDesignable class RoundImageClass: UIImageView
{
    override func layoutSubviews()
    {
        layer.cornerRadius = bounds.size.width/2;
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
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


@IBDesignable class OpenSpaceTextField : UITextField
{
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
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

@IBDesignable class QSButton : UIButton
{
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
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

@IBDesignable class SetViewClass : UIView
{
    override func layoutSubviews()
    {
        //layer.cornerRadius = bounds.size.width/2;
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
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}




@IBDesignable class SmartFoodImage: UIImageView
{
    override func layoutSubviews()
    {
        layer.cornerRadius = self.frame.size.width / 2 // bounds.size.width/2;
    }
    
    @IBInspectable var clipToBound: Bool = true {
        didSet {
            self.clipsToBounds = clipsToBounds
        }
    }
    
    @IBInspectable var maskToBounds : Bool = true  {
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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

@IBDesignable class LableDesign: UILabel {
   
}

@IBDesignable

class CurvedUIImageView: UIView {
    
    private func pathCurvedForView(givenView: UIView, curvedPercent:CGFloat) ->UIBezierPath
    {
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x:0, y:0))
        arrowPath.addLine(to: CGPoint(x:givenView.bounds.size.width, y:0))
        arrowPath.addLine(to: CGPoint(x:givenView.bounds.size.width, y:givenView.bounds.size.height))
        arrowPath.addQuadCurve(to: CGPoint(x:0, y:givenView.bounds.size.height), controlPoint: CGPoint(x:givenView.bounds.size.width/2, y:givenView.bounds.size.height-givenView.bounds.size.height*curvedPercent))
        arrowPath.addLine(to: CGPoint(x:0, y:0))
        arrowPath.close()
        
        return arrowPath
    }
    
    @IBInspectable var curvedPercent : CGFloat = 0{
        didSet{
            guard curvedPercent <= 1 && curvedPercent >= 0 else{
                return
            }
            
            let shapeLayer = CAShapeLayer(layer: self.layer)
            shapeLayer.path = self.pathCurvedForView(givenView: self,curvedPercent: curvedPercent).cgPath
            shapeLayer.frame = self.bounds
            shapeLayer.masksToBounds = true
            self.layer.mask = shapeLayer
        }
    }
    
}

@IBDesignable
class GradientView: UIView {

    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}
