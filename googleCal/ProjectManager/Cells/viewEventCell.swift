//
//  viewEventCell.swift
//  googleCal
//
//  Created by Tecocraft Tech on 29/03/18.
//  Copyright © 2018 kishan. All rights reserved.
//

import UIKit

class viewEventCell: UITableViewCell {

    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var lblplus: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblReminder: UILabel!
    @IBOutlet weak var lblDt: UILabel!
    @IBOutlet weak var lblnotes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
