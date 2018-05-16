//
//  ControllerSplash.swift
//  Train
//
//  Created by logan on 2018/04/08.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class SplashViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let imgView = UIImageView(image: UIImage(named: "LaunchImage"))
        self.view.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        // サブスレッドで実行
        DispatchQueue.global(qos: .default).async {
            // サブスレッド(バックグラウンド)で実行する方を書く
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                // Main Threadで実行する
                guard let authToken = AppConfig.appConfig.authToken, authToken.count > 0 else {
                    self.navigationController?.pushViewController(LoginController(), animated: true)
                    return
                }
                self.navigationController?.pushViewController(HomeController(), animated: true)
            })
        }
    }
    

}
