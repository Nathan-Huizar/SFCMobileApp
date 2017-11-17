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
    
//    lazy var profileImageCell: ProfileImageCell = {
//        let imageCell = ProfileImageCell()
//        imageCell.layer.cornerRadius = 10
//        return imageCell
//    }()
    
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
        textView.textColor = UIColor.rgb(red: 39, green: 89, blue: 140)
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.textAlignment = .center
        return textView
    }()
    
    override func setupViews() {
        
        // Arbitrary
        let imageOffset = frame.width * 0.275
        let imageWidth = frame.width * 0.45
        
        let profileImageCell = ProfileImageCell(frame: .zero, width: imageWidth)
        
        //addSubview(profileImageView)
        addSubview(profileImageCell)
        addSubview(nameTextField)
        addSubview(logoutTextView)
        
        addConstraintsWithFormat(format: "H:|-(\(imageOffset))-[v0(\(imageWidth))]", views: profileImageCell)
        addConstraintsWithFormat(format: "H:|[v0]|", views: nameTextField)
        addConstraintsWithFormat(format: "H:|[v0]|", views: logoutTextView)
        addConstraintsWithFormat(format: "V:|-30-[v0(\(imageWidth))]-5-[v1(32)]-0-[v2(35)]", views: profileImageCell, nameTextField, logoutTextView)
       // profileImageCell.layer.cornerRadius = imageWidth / 2
    }
    
}
