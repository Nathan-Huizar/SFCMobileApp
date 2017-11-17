//
//  SocialMediaCell.swift
//  SFCMobileApp
//
//  Created by Christopher Villanueva on 11/11/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class SocialMediaCell: BaseCell {
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = frame.width / 2
        imageView.backgroundColor = UIColor.rgb(red: 111, green: 129, blue: 140)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        addSubview(iconImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: iconImageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: iconImageView)
    }
}
