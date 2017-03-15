//
//  ShadowDesign.swift
//  socialapp
//
//  Created by 小林 泰 on 2017/03/15.
//  Copyright © 2017年 TokyoIceHockeyChannel. All rights reserved.
//

import UIKit

class ShadowDesign: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: SHADOW_GRAY).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
}
