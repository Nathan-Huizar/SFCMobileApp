//
//  ProfileImageCell.swift
//  SFCMobileApp
//
//  Created by Christopher Villanueva on 11/11/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class ProfileImageCell: UIView {
    
    lazy var firstLayer: UIView = {
        let first = UIView()
        first.backgroundColor = UIColor.rgb(red: 26, green: 61, blue: 89)
        first.layer.masksToBounds = true
        first.translatesAutoresizingMaskIntoConstraints = false
        return first
    }()
    
    lazy var secondLayer: UIView = {
        let second = UIView()
        second.backgroundColor = UIColor.rgb(red: 32, green: 77, blue: 119)
        second.layer.masksToBounds = true
        second.translatesAutoresizingMaskIntoConstraints = false
        return second
    }()
    
    lazy var thirdLayer: UIView = {
        let third = UIView()
        third.backgroundColor = UIColor.rgb(red: 39, green: 89, blue: 140)
        third.layer.masksToBounds = true
        third.translatesAutoresizingMaskIntoConstraints = false
        return third
    }()
    
    lazy var imageLayer: UIImageView = {
        let imageLayer = UIImageView()
        imageLayer.image = UIImage(named: "chris")
        imageLayer.layer.masksToBounds = true
        imageLayer.contentMode = .scaleAspectFit
        imageLayer.translatesAutoresizingMaskIntoConstraints = false
        return imageLayer
    }()
    
    func setupViews(width: CGFloat) {
        addSubview(firstLayer)
        addSubview(secondLayer)
        addSubview(thirdLayer)
        addSubview(imageLayer)
        
        firstLayer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        firstLayer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        firstLayer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        firstLayer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        firstLayer.layer.cornerRadius = width / 2
        
//        let blurEffect = UIBlurEffect(style: .regular)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = firstLayer.frame
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        firstLayer.addSubview(blurEffectView)
        
        secondLayer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondLayer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        secondLayer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.875).isActive = true
        secondLayer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.875).isActive = true
        secondLayer.layer.cornerRadius = (width * 0.875) / 2
        
        thirdLayer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        thirdLayer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        thirdLayer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75).isActive = true
        thirdLayer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75).isActive = true
        thirdLayer.layer.cornerRadius = (width * 0.75) / 2
        
        imageLayer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageLayer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageLayer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.625).isActive = true
        imageLayer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.625).isActive = true
        imageLayer.layer.cornerRadius = (width * 0.625) / 2
    }
  
    init(frame: CGRect, width: CGFloat) {
        super.init(frame: frame)
        setupViews(width: width)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
