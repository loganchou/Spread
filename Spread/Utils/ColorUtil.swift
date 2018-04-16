//
//  ColorUtil.swift
//  Train
//
//  Created by logan on 2018/04/09.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class ColorUtil {
    
    static func AppRGBA(red r:CGFloat,green g:CGFloat,blue b:CGFloat) -> UIColor {
        return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
    }
    
    static func AppRGBA(red r:CGFloat, green g:CGFloat, blue b:CGFloat, alpha a:CGFloat) -> UIColor {
        return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: (a)*1.0)
    }
}

