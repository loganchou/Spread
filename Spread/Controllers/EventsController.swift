//
//  EventsController.swift
//  Train
//
//  Created by logan on 2018/04/09.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class EventsController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Home"
        
        //show NavigationBar
        if let navController = self.navigationController {
            navController.setNavigationBarHidden(false, animated: true)
        }
        
        let label = UILabel()
        label.text = "Home"
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
