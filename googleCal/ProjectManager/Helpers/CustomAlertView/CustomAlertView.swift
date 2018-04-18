//
//  CustomAlertView.swift
//  CustomAlertView
//
//  Created by Daniel Luque Quintana on 16/3/17.
//  Copyright © 2017 dluque. All rights reserved.
//

import UIKit

class CustomAlertView: UIViewController {
    

//@IBOutlet weak var alertView: UIView!
    
    
    var delegate: CustomAlertViewDelegate?
    let alertViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        
        animateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
       // cancelButton.addBorder(side: .Top, color: alertViewGrayColor, width: 1)
       // cancelButton.addBorder(side: .Right, color: alertViewGrayColor, width: 1)
        //okButton.addBorder(side: .Top, color: alertViewGrayColor, width: 1)
    }
    
    func setupView() {
        //alertView.layer.cornerRadius = 9
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        //alertView.dropShadow()
       
        
    }
    
    func animateView() {
//        alertView.alpha = 0;
//        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
//        UIView.animate(withDuration: 0.4, animations: { () -> Void in
//            self.alertView.alpha = 1.0;
//            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
//        })
    }
    

}
