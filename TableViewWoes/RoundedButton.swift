//
//  RoundedButton.swift
//  magnet-ios
//
//  Created by Bruno Scheele on 04/03/15.
//  Copyright (c) 2015 Magnet.me. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton
{
    private var _normalColor: UIColor?
    private var _highlightedColor: UIColor?
    private var _selectedColor: UIColor?
    private var _disabledColor: UIColor?
    
    @IBInspectable var normalColor: UIColor? {
        get {
            return _normalColor
        }
        set {
            _normalColor = newValue
            setBackgroundColor(_normalColor, forState: UIControlState.Normal)
        }
    }
    
    @IBInspectable var highlightedColor: UIColor? {
        get {
            return _highlightedColor
        }
        set {
            _highlightedColor = newValue
            setBackgroundColor(_highlightedColor, forState: UIControlState.Highlighted)
        }
    }
    
    @IBInspectable var selectedColor: UIColor? {
        get {
            return _selectedColor
        }
        set {
            _selectedColor = newValue
            setBackgroundColor(_selectedColor, forState: UIControlState.Selected)
        }
    }
    
    @IBInspectable var disabledColor: UIColor? {
        get {
            return _disabledColor
        }
        set {
            _disabledColor = newValue
            setBackgroundColor(_disabledColor, forState: UIControlState.Disabled)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    func setBackgroundColor(color: UIColor?, forState state: UIControlState)
    {
        if let color = color {
            setBackgroundImage(UIImage.getImageWithColor(color, size: CGSize(width: 1, height: 1)), forState: state)
        }
        else {
            setBackgroundImage(nil, forState: state)
        }
    }
}

extension UIImage
{
    class func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        var rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}


