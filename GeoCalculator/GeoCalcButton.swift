//
//  GeoCalcButton.swift
//  GeoCalculator
//  Submitted by Lohith and Brain
//  Created by Lohith on 5/28/18.
//

import UIKit

class GeoCalcButton: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = FOREGROUND_COLOR
        
        self.setTitleColor(BACKGROUND_COLOR, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        
        
       
    }
    


}
