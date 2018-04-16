//
//  BaseTabBarController.swift
//  Spread
//
//  Created by logan on 2018/04/15.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let home = EventsController()
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home-filled"))
        homeTabBarItem.tag = 0
        home.tabBarItem = homeTabBarItem
        
        let search = SearchController()
        let searchTabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), selectedImage: UIImage(named: "search-filled"))
        searchTabBarItem.tag = 1
        search.tabBarItem = searchTabBarItem
        
        let favorite = EventsController()
        let favoriteTabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "heart"), selectedImage: UIImage(named: "heart-filled"))
        favoriteTabBarItem.tag = 2
        favorite.tabBarItem = favoriteTabBarItem

        let my = MyController()
        let myTabBarItem = UITabBarItem(title: "Personal", image: UIImage(named: "user"), selectedImage: UIImage(named: "user-filled"))
        myTabBarItem.tag = 3
        my.tabBarItem = myTabBarItem
        
        let controllers = [home, search, favorite, my]
        self.viewControllers = controllers.map {UINavigationController(rootViewController: $0)}
        self.delegate = self
    }
    
    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        viewController.tabBarItem.badgeValue = "2"
    }
    
}

