//
//  FavoriteController.swift
//  Spread
//
//  Created by logan on 2018/04/15.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class FavoriteController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Favorite"
        
        let label = UILabel()
        label.text = self.title
        label.font = UIFont(name: label.font.fontName, size: 30)
        label.textAlignment = .center
        canvas.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
            make.center.equalTo(canvas)
        }
        
    }
}
