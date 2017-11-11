//
//  MenuHeaderCell.swift
//  SFCMobileApp
//
//  Created by Christopher Villanueva on 11/10/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class MenuHeaderCell: BaseCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "chris")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameTextField: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.text = "Chris Villanueva"
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.textAlignment = .center
        return textView
    }()
    
    let logoutTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.text = "Logout"
        textView.textColor = UIColor.rgb(red: 50, green: 50, blue: 255)
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.textAlignment = .center
        return textView
    }()
    
    override func setupViews() {
        addSubview(profileImageView)
        addSubview(nameTextField)
        addSubview(logoutTextView)
        
        let imageOffset = frame.width * 0.3
        let imageWidth = frame.width * 0.4

        addConstraintsWithFormat(format: "H:|-(\(imageOffset))-[v0(\(imageWidth))]", views: profileImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: nameTextField)
        addConstraintsWithFormat(format: "H:|[v0]|", views: logoutTextView)
        addConstraintsWithFormat(format: "V:|-40-[v0(\(imageWidth))]-15-[v1(32)]-0-[v2(35)]", views: profileImageView, nameTextField, logoutTextView)
        profileImageView.layer.cornerRadius = imageWidth / 2
    }
    
}
