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

        //show NavigationBar
        if let navController = self.navigationController {
            navController.setNavigationBarHidden(false, animated: true)
        }
        
    }
}
