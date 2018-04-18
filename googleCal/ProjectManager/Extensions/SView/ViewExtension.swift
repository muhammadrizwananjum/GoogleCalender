//
//  veiwExtensions.swift
//  Flinkar_Driver
//
//  Created by Tecocraft on 28/06/17.
//  Copyright © 2017 Siddharth Vora. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //ADD SHADOW
    func dropShadow(scale: Bool = true) {
        
        //self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        //
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        //self.layer.cornerRadius = 4
    }
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 3.0) {
        layer.cornerRadius = 8.0
       
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    //ADD BORDER TO VIEW
    func addCornerRadiusWithBoader(radius:CGFloat, color: UIColor, borderWidth: CGFloat){
            self.layer.cornerRadius = CGFloat(radius)
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = color.cgColor
            self.clipsToBounds = true
    }
    
    
    
}

