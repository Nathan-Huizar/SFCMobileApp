//
//  MenuCell.swift
//  SFCMobileApp
//
//  Created by Christopher Villanueva on 11/10/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class MenuBodyCell: BaseCell {
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 0.0353, green: 0.1843, blue: 0.2667, alpha: 1.0)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(red: 0.0353, green: 0.1843, blue: 0.2667, alpha: 1.0)
        textView.text = "Home"
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.isEditable = false
        return textView
    }()
    
    override func setupViews() {
        addSubview(iconImageView)
        addSubview(labelTextView)
        
        addConstraintsWithFormat(format: "H:|-0-[v0(\(frame.width * 0.25))]-0-[v1]-0-|", views: iconImageView, labelTextView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: iconImageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: labelTextView)
        
    }
    
}
