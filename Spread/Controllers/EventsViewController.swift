//
//  EventsViewController.swift
//  Train
//
//  Created by logan on 2018/04/09.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class EventsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var events = [Event]()
    var refreshControl: UIRefreshControl!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //show NavigationBar
        if let navController = self.navigationController {
            navController.setNavigationBarHidden(false, animated: true)
        }
        
        // tableView
        self.tableView = UITableView(frame: view.bounds, style: .grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(EventTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(EventTableViewCell.self))
        
        self.tableView.estimatedRowHeight = 400
        self.tableView.rowHeight = UITableViewAutomaticDimension

        self.canvas.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.canvas)
        }
        
        // refreshControl
        self.refreshControl = UIRefreshControl()
        self.refreshControl.backgroundColor = UIColor.red
        self.refreshControl.tintColor = UIColor.yellow
        self.tableView.addSubview(self.refreshControl)

        // load event data
        self.displaySpinner(ownView: self.tableView)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.getEvents()
            self.tableView.reloadData()
            self.removeSpinner()
        })
    }
    
    // MARK: - UITableViewDelegate
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NSStringFromClass(EventTableViewCell.self),
            for: indexPath) as! EventTableViewCell
        cell.event = events[indexPath.row]
        return cell
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 350
//    }
    
//    var cellHeight: CGFloat = 200
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cellHeight = cell.frame.height
//    }

//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return cellHeight
//    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    // MARK: - private method
    // get events
    private func getEvents() {
        events.removeAll()
        
        for i in 1...10 {
            let index = String(i)
            
            let e = Event()
            e.nickname = "nickname" + index
            e.profilePhoto = "profilePhoto"
            e.publishTime = index + "hours ago"
            
            e.eventImage = "home" + index
            e.desc = "The purpose of this plugin is to to show a list of event" + index
            e.location = "location" + index
            e.startDate = "August 24"
            e.endDate = "26"
            e.likeCount = "88"  + index
            e.commentCount = "168" + index
            
            events.append(e)
        }
    }

}
