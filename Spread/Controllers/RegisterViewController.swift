//
//  RegisterViewController.swift
//  Train
//
//  Created by logan on 2018/04/12.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController, UITextFieldDelegate {
    var userId: UITextField!    //user id
    var password: UITextField!  //password
    var repeatPwd: UITextField!  //repeat password
    var signup: UIButton!       //sign in
    var back: UIButton!       //sign up
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.title = "Sign Up"
        
        //Hidden NavigationBar
        if let navController = self.navigationController {
            navController.setNavigationBarHidden(true, animated: false)
        }
        
        let top = (self.view.frame.size.height - 380) / 2
        
        //title
        let title = UILabel()
        title.text = "Sign Up"
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 30)
        canvas.addSubview(title)
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
        canvas.addSubview(self.userId)
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
        canvas.addSubview(self.password)
        self.password.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.top.equalTo(self.userId.snp.bottom).offset(20)
        }
        
        //repeat password text field
        self.repeatPwd = UITextField()
        self.repeatPwd.delegate = self
        self.repeatPwd.placeholder = "Repeat Password"
        self.repeatPwd.tag = 102
        self.repeatPwd.borderStyle = UITextBorderStyle.roundedRect
        self.repeatPwd.returnKeyType = UIReturnKeyType.next
        canvas.addSubview(self.repeatPwd)
        self.repeatPwd.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.top.equalTo(self.password.snp.bottom).offset(20)
        }
        
        //signin button
        self.signup = UIButton()
        self.signup.setTitle("Sign Up", for: UIControlState())
        self.signup.setTitleColor(UIColor.white, for: UIControlState())
        self.signup.layer.cornerRadius = 5
        self.signup.backgroundColor = ColorUtil.AppRGBA(red: 44, green: 99, blue: 210)
        self.signup.addTarget(self, action: #selector(signupClick), for: .touchUpInside)
        canvas.addSubview(self.signup)
        self.signup.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.top.equalTo(self.repeatPwd.snp.bottom).offset(20)
        }
        
        //back to log in
        let statement = UILabel()
        statement.text = "Already have an account?"
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
            make.top.equalTo(signup.snp.bottom).offset(30)
        }
        
        //Back button
        self.back = UIButton()
        self.back.setTitle("Back To Log In", for: UIControlState())
        self.back.setTitleColor(UIColor.white, for: UIControlState())
        self.back.layer.cornerRadius = 5
        self.back.backgroundColor = ColorUtil.AppRGBA(red: 44, green: 99, blue: 210)
        self.back.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        canvas.addSubview(self.back)
        self.back.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.top.equalTo(statement.snp.bottom).offset(10)
        }
    }
    
    @objc private func signupClick(sender: UIButton) {
        self.displaySpinner(ownView: canvas)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.removeSpinner()

            // define alert
            let alert = UIAlertController(
                title: "You have successfully registered and logged in.",
                message: nil,
                preferredStyle: .alert)
            
            // show alert
            self.present(alert, animated: true, completion: nil)
        
            // close alert after tow seconds
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
                if let navController = self.navigationController {
                    navController.viewControllers.removeAll()
                    navController.pushViewController(BaseTabBarController(), animated: true)
                }
            }
            
        })
    }
    
    @objc private func backClick(sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

}
