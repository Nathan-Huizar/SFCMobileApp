//
//  CalendarCell.swift
//  SFCMobileApp
//
//  Created by Nathan Huizar on 10/27/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class calendarCell : UICollectionViewCell {
    override init (frame: CGRect){
        super.init(frame:frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupViews(){
        backgroundColor = UIColor(red: 0.0353, green: 0.1843, blue: 0.2667, alpha: 1.0)
        addSubview(thumbnailImageView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
