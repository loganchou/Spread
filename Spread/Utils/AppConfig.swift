//
//  AppConfig.swift
//  Train
//
//  Created by logan on 2018/04/09.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class AppConfig {
    
    static let appConfig = AppConfig()
    
    var authToken: String?
    
    private init() {
        self.authToken = UserDefaults.standard.value(forKey: "userInfoUserToken") as? String
    }
}
