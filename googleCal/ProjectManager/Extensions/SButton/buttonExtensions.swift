//
//  buttonExtensions.swift
//  reconshield
//
//  Created by Tecocraft on 09/08/17.
//  Copyright © 2017 tecocraft. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    func setButtonBorder() {
        
        
        //self.titleLabel?.font = UIFont.systemFont(ofSize: (SCREEN_WIDTH * 15.0) / 320.0 )
        //self.backgroundColor = sDefaultViewColorPrimary
        self.layer.cornerRadius = 0
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }

}
