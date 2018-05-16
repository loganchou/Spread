//
//  BaseViewController.swift
//  Train
//
//  Created by logan on 2018/04/08.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    let canvas = UIView()
    var spinner = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //add canvas
        self.view.addSubview(canvas)
        canvas.backgroundColor = ColorUtil.AppRGBA(red: 250, green: 250, blue: 250)
        canvas.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // display spinner view
    func displaySpinner(ownView : UIView) {
        self.spinner.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        self.spinner.center = ownView.center
        self.spinner.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        self.spinner.clipsToBounds = true
        self.spinner.layer.cornerRadius = 10
        
        self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.activityIndicator.activityIndicatorViewStyle = .whiteLarge
        self.activityIndicator.center = CGPoint(
            x: self.spinner.frame.size.width / 2,
            y: self.spinner.frame.size.height / 2)
        
        DispatchQueue.main.async {
            self.spinner.addSubview(self.activityIndicator)
            ownView.addSubview(self.spinner)
            self.activityIndicator.startAnimating()
        }
    }
    
    // remove spinner view
    func removeSpinner() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.spinner.removeFromSuperview()
        }
    }
}
