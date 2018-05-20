//
//  LoginViewController.swift
//  Train
//
//  Created by logan on 2018/04/09.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {

    var userId: UITextField!    //user id
    var password: UITextField!  //password
    var signin: UIButton!       //sign in
    var signup: UIButton!       //sign up
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.title="Log In"
        
        //Hidden NavigationBar
        if let navController = self.navigationController {
            navController.setNavigationBarHidden(true, animated: false)
        }
        
        let top = (self.view.frame.size.height - 380) / 2

        //title
        let title = UILabel()
        title.text = "Spread"
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 30)
        self.canvas.addSubview(title)
        title.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(canvas)
            make.height.equalTo(34)
            make.top.equalTo(canvas.snp.top).offset(top)
        }
        
        //user text field
        self.userId = UITextField()
        self.userId.delegate = self
        self.userId.placeholder = "Email"
        self.userId.tag = 100
        self.userId.borderStyle = UITextBorderStyle.roundedRect
        self.userId.returnKeyType = UIReturnKeyType.next
        self.canvas.addSubview(self.userId)
        self.userId.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.top.equalTo(title.snp.bottom).offset(20)
        }
        
        //password text field
        self.password = UITextField()
        self.password.delegate = self
        self.password.placeholder = "Password"
        self.password.tag = 101
        self.password.borderStyle = UITextBorderStyle.roundedRect
        self.password.returnKeyType = UIReturnKeyType.next
        self.canvas.addSubview(self.password)
        self.password.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.top.equalTo(self.userId.snp.bottom).offset(20)
        }

        //signin button
        self.signin = UIButton()
        self.signin.setTitle("Log In", for: UIControlState())
        self.signin.setTitleColor(UIColor.white, for: UIControlState())
        self.signin.layer.cornerRadius = 5
        self.signin.backgroundColor = ColorUtil.AppRGBA(red: 44, green: 99, blue: 210)
        self.signin.addTarget(self, action: #selector(signinClick), for: .touchUpInside)
        canvas.addSubview(self.signin)
        self.signin.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.top.equalTo(self.password.snp.bottom).offset(20)
        }
        
        //Sign Up Policy
        let statement = UILabel()
        statement.text = "By clicking Create Account, you agree to our Terms and that you have read our Data Policy. You may receive Mail Notifications from Train."
        statement.textColor = UIColor.black
        statement.font = UIFont.systemFont(ofSize: 10)
        statement.lineBreakMode = .byWordWrapping
        statement.numberOfLines = 0
        
        let maxWidth = UIScreen.main.bounds.size.width - 40
        statement.preferredMaxLayoutWidth = maxWidth
        statement.layoutIfNeeded()
        
        canvas.addSubview(statement)
        statement.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(signin.snp.bottom).offset(30)
        }
        
        //Sign Up button
        self.signup = UIButton()
        self.signup.setTitle("Create Account", for: UIControlState())
        self.signup.setTitleColor(UIColor.white, for: UIControlState())
        self.signup.layer.cornerRadius = 5
        self.signup.backgroundColor = ColorUtil.AppRGBA(red: 44, green: 99, blue: 210)
        self.signup.addTarget(self, action: #selector(signupClick), for: .touchUpInside)
        canvas.addSubview(self.signup)
        self.signup.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.top.equalTo(statement.snp.bottom).offset(10)
        }
    }
    
    @objc private func signinClick(sender: UIButton) {
        self.displaySpinner(ownView: canvas)
        
        // サブスレッド(バックグラウンド)で実行する方を書く
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.removeSpinner()
            if let navController = self.navigationController {
                navController.viewControllers.removeAll()
                navController.pushViewController(BaseTabBarController(), animated: true)
            }
        })
    }
    
    @objc private func signupClick(sender: UIButton) {
        if let navController = self.navigationController {
            navController.pushViewController(RegisterViewController(), animated: true)
        }
    }
}

