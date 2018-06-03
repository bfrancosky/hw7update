//
//  GeoCalcTextField.swift
//  GeoCalculator
//  Submitted by Lohith and Brain
//  Created by Lohith on 5/28/18.
//

import UIKit

class GeoCalcTextField: DecimalMinusTextField {
    override func awakeFromNib() {
        //super.awakeFromNib()
        self.backgroundColor = BACKGROUND_COLOR1
        self.backgroundColor = UIColor.clear
        
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.borderStyle = .roundedRect
        self.layer.borderColor = FOREGROUND_COLOR3.cgColor
        
         self.textColor = FOREGROUND_COLOR3
        
        guard let ph = self.placeholder  else {
            return
        }
        
        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSForegroundColorAttributeName :
                FOREGROUND_COLOR])
    }
}
