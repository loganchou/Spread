//
//  EventTableViewCell.swift
//  Spread
//
//  Created by logan on 2018/04/19.
//  Copyright © 2018年 logan. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    let padding: CGFloat = 5
    let photoSize: CGFloat = 38
    
    var nickname: UILabel!
    var profilePhoto: UIImageView!
    var publishTime: UILabel!
    var eventImage: UIImageView!
    var desc: UILabel!
    var locationIcon: UIImageView!
    var location: UILabel!
    var holdingTimeIcon: UIImageView!
    var holdingTime: UILabel!
    var likeIcon: UIImageView!
    var likeCount: UILabel!
    var commentIcon: UIImageView!
    var commentCount: UILabel!
    
    var event: Event? {
        didSet {
            if let event = event {
                self.nickname.text = event.nickname
                self.profilePhoto.image = self.getImageWithDefault(event.profilePhoto)
                self.publishTime.text = event.publishTime
                if let image = self.getImageWithDefault(event.eventImage) {
                    self.eventImage.image = fitToScreenWidth(image)
                }
                
                self.desc.text = event.desc
                self.location.text = event.location
                self.holdingTime.text = event.startDate! + " ~ " + event.endDate!
                self.likeCount.text = event.likeCount
                self.commentCount.text = event.commentCount
            }
        }
    }
    
    // get image
    // if can't get image then return default
    private func getImageWithDefault(_ name: String?) -> UIImage? {
        if let name = name, name.count > 0, let image = UIImage(named: name){
            return image
        } else {
            return UIImage(named: "no-image")
        }
    }
    
    private func fitToScreenWidth(_ image: UIImage) -> UIImage {
        let screenSize: CGRect = UIScreen.main.bounds
        return resizeImage(image, newWidth: screenSize.width - 2 * self.padding)
    }
    
    private func resizeImage(_ image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none

        // profile Photo
//        self.profilePhoto = UIImageView(
//            frame: CGRect(x: 0, y: self.padding, width: self.photoSize, height: self.photoSize))
        self.profilePhoto = UIImageView()
        self.profilePhoto.contentMode = .scaleAspectFill
        self.profilePhoto.layer.masksToBounds = true
        self.profilePhoto.layer.cornerRadius = self.profilePhoto.frame.width / 2
        self.contentView.addSubview(self.profilePhoto)
        self.profilePhoto.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.contentView.snp.top).offset(self.padding)
            make.left.equalTo(self.contentView.snp.left).offset(self.padding)
            make.width.equalTo(self.photoSize)
            make.height.equalTo(self.photoSize)
        }
        
        // nickname
        self.nickname = UILabel()
        self.nickname.textAlignment = .left
        self.nickname.textColor = UIColor.black
        self.contentView.addSubview(self.nickname)
        self.nickname.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.profilePhoto)
            make.left.equalTo(self.profilePhoto.snp.right).offset(self.padding)
        }
        
        // publishTime
        self.publishTime = UILabel()
        self.publishTime.textAlignment = .right
        self.publishTime.textColor = UIColor.black
        self.contentView.addSubview(self.publishTime)
        self.publishTime.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.profilePhoto)
            make.right.equalTo(self.contentView.snp.right).offset(-self.padding)
        }
        
        // event Image
        self.eventImage = UIImageView()
        self.contentView.addSubview(self.eventImage)
        self.eventImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.profilePhoto.snp.bottom).offset(self.padding)
            make.left.equalTo(self.contentView.snp.left).offset(self.padding)
//            make.height.equalTo(10 * self.padding)
        }
        
        // desc
        self.desc = UILabel()
        self.desc.textAlignment = .left
        self.desc.textColor = UIColor.black
        self.desc.lineBreakMode = .byWordWrapping
        self.desc.numberOfLines = 0
        self.contentView.addSubview(self.desc)
        let maxWidth = UIScreen.main.bounds.size.width - 10
        self.desc.preferredMaxLayoutWidth = maxWidth
        self.desc.layoutIfNeeded()
        self.desc.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.eventImage.snp.bottom).offset(self.padding)
            make.left.equalTo(self.contentView.snp.left).offset(self.padding)
        }
        
        // location Icon
        self.locationIcon = UIImageView(image: UIImage(named: "location"))
        self.contentView.addSubview(self.locationIcon)
        self.locationIcon.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.desc.snp.bottom).offset(self.padding)
            make.left.equalTo(self.contentView.snp.left).offset(self.padding)
        }
        
        // location
        self.location = UILabel()
        self.location.textAlignment = .left
        self.location.textColor = UIColor.black
        self.contentView.addSubview(self.location)
        self.location.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.locationIcon)
            make.left.equalTo(self.locationIcon.snp.right).offset(self.padding)
        }
        
        // holdingTime Icon
        self.holdingTimeIcon = UIImageView(image: UIImage(named: "clock"))
        self.contentView.addSubview(self.holdingTimeIcon)
        self.holdingTimeIcon.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.locationIcon.snp.bottom).offset(self.padding)
            make.left.equalTo(self.contentView.snp.left).offset(self.padding)
        }
        
        // holdingTime
        self.holdingTime = UILabel()
        self.holdingTime.textAlignment = .left
        self.holdingTime.textColor = UIColor.black
        self.contentView.addSubview(self.holdingTime)
        self.holdingTime.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.holdingTimeIcon)
            make.left.equalTo(self.holdingTimeIcon.snp.right).offset(self.padding)
        }
        
        // like Icon
        self.likeIcon = UIImageView(image: UIImage(named: "like"))
        self.contentView.addSubview(self.likeIcon)
        self.likeIcon.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.holdingTimeIcon.snp.bottom).offset(self.padding)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-2 * self.padding)
            make.left.equalTo(self.contentView.snp.left).offset(self.padding)
        }
        
        // like Count
        self.likeCount = UILabel()
        self.likeCount.textAlignment = .left
        self.likeCount.textColor = UIColor.black
        self.contentView.addSubview(self.likeCount)
        self.likeCount.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.likeIcon)
            make.left.equalTo(self.likeIcon.snp.right).offset(self.padding)
        }
        
        // comment Icon
        self.commentIcon = UIImageView(image: UIImage(named: "comment"))
        self.contentView.addSubview(self.commentIcon)
        self.commentIcon.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.likeIcon)
            make.left.equalTo(self.likeCount.snp.right).offset(4 * self.padding)
        }
        
        // comment Count
        self.commentCount = UILabel()
        self.commentCount.textAlignment = .left
        self.commentCount.textColor = UIColor.black
        self.contentView.addSubview(self.commentCount)
        self.commentCount.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.likeIcon)
            make.left.equalTo(self.commentIcon.snp.right).offset(self.padding)
        }
    }
}
