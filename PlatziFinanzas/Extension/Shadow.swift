//
//  Shadow.swift
//  PlatziFinanzas
//
//  Created by everis on 3/04/19.
//  Copyright © 2019 Jamer Quiroga. All rights reserved.
//

import UIKit

extension UIView {
    
    var borderUIColor: UIColor{
        
        get{
            guard let color = layer.borderColor else {
                return UIColor.black
            }
            return UIColor(cgColor: color)
        }
        
        set{
            layer.borderColor = newValue.cgColor
        }

    }
}
