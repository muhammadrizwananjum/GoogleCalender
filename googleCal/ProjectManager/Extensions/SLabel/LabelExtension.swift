//
//  File.swift
//  GaurdShield
//
//  Created by Tecocraft Tech on 28/12/17.
//  Copyright © 2017 Tecocraft Tech. All rights reserved.
//

import Foundation

class CustomBtn : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
                if self.tag == 106{//system
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 6.0) / 320.0))
                }else if self.tag == 107{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 7.0) / 320.0))
                }else if self.tag == 108{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 8.0) / 320.0))
                }else if self.tag == 109{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 9.0) / 320.0))
                }else if self.tag == 110{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 10.0) / 320.0))
                }else if self.tag == 111{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 11.0) / 320.0))
                }else if self.tag == 112{
                   self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 12.0) / 320.0))
                }else if self.tag == 113{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 13.0) / 320.0))
                }else if self.tag == 114{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 14.0) / 320.0))
                }else if self.tag == 115{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 15.0) / 320.0))
                }else if self.tag == 116{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 16.0) / 320.0))
                }else if self.tag == 117{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 17.0) / 320.0))
                }else if self.tag == 118{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 18.0) / 320.0))
                }else if self.tag == 119{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 19.0) / 320.0))
                }else if self.tag == 120{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 20.0) / 320.0))
                }else if self.tag == 121{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 21.0) / 320.0))
                }else if self.tag == 122{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 22.0) / 320.0))
                }else if self.tag == 123{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 23.0) / 320.0))
                }else if self.tag == 124{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 24.0) / 320.0))
                }else if self.tag == 125{
                    self.titleLabel?.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 25.0) / 320.0))
                }else if self.tag == 1111{//system bold
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 14.0) / 320.0))
                }else if self.tag == 1121{//system bold
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 14.0) / 320.0))
                }else if self.tag == 1131{//system bold
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 14.0) / 320.0))
                }else if self.tag == 1141{//system bold
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 14.0) / 320.0))
                }else if self.tag == 1151{
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 15.0) / 320.0))
                }else if self.tag == 1171{
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 17.0) / 320.0))
                }else if self.tag == 1122{//semi bold
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueMedium, size: ((SCREEN_WIDTH * 12.0) / 320.0))
                }else if self.tag == 1172{
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueMedium, size: ((SCREEN_WIDTH * 17.0) / 320.0))
                }else if self.tag == 1153{//medium
                    self.titleLabel?.font = UIFont(name: sDefaultFontHelveticaNeueMedium, size: ((SCREEN_WIDTH * 15.0) / 320.0))
                }
    }

}
class CustomLbl: UILabel {
    override func layoutSubviews() {
        if self.tag == 106{//system
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 6.0) / 320.0))
        }else if self.tag == 107{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 7.0) / 320.0))
        }else if self.tag == 108{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 8.0) / 320.0))
        }else if self.tag == 109{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 9.0) / 320.0))
        }else if self.tag == 110{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 10.0) / 320.0))
        }else if self.tag == 111{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 11.0) / 320.0))
        }else if self.tag == 112{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 12.0) / 320.0))
        }else if self.tag == 113{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 13.0) / 320.0))
        }else if self.tag == 114{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 14.0) / 320.0))
        }else if self.tag == 115{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 15.0) / 320.0))
        }else if self.tag == 116{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 16.0) / 320.0))
        }else if self.tag == 117{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 17.0) / 320.0))
        }else if self.tag == 118{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 18.0) / 320.0))
        }else if self.tag == 119{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 19.0) / 320.0))
        }else if self.tag == 120{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 20.0) / 320.0))
        }else if self.tag == 121{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 21.0) / 320.0))
        }else if self.tag == 122{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 22.0) / 320.0))
        }else if self.tag == 123{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 23.0) / 320.0))
        }else if self.tag == 124{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 24.0) / 320.0))
        }else if self.tag == 125{
            self.font = UIFont(name: sHelveticaNeue, size: ((SCREEN_WIDTH * 25.0) / 320.0))
        }else if self.tag == 1121{//system bold
            self.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 12.0) / 320.0))
        }else if self.tag == 1141{//system bold
            self.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 14.0) / 320.0))
        }else if self.tag == 1151{
            self.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 15.0) / 320.0))
        }else if self.tag == 1171{
            self.font = UIFont(name: sDefaultFontHelveticaNeueBold, size: ((SCREEN_WIDTH * 17.0) / 320.0))
        }else if self.tag == 1122{//semi bold
            self.font = UIFont(name: sDefaultFontHelveticaNeueMedium, size: ((SCREEN_WIDTH * 12.0) / 320.0))
        }else if self.tag == 1172{
            self.font = UIFont(name: sDefaultFontHelveticaNeueMedium, size: ((SCREEN_WIDTH * 17.0) / 320.0))
        }else if self.tag == 1123{
            self.font = UIFont(name: sDefaultFontHelveticaNeueMedium, size: ((SCREEN_WIDTH * 12.0) / 320.0))
        }else if self.tag == 1143{
            self.font = UIFont(name: sDefaultFontHelveticaNeueMedium, size: ((SCREEN_WIDTH * 14.0) / 320.0))
        }else if self.tag == 1153{//medium
            self.font = UIFont(name: sDefaultFontHelveticaNeueMedium, size: ((SCREEN_WIDTH * 15.0) / 320.0))
        }
    }
}

