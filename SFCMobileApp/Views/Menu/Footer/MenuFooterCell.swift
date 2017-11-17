//
//  MenuFooterCell.swift
//  SFCMobileApp
//
//  Created by Christopher Villanueva on 11/11/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

private let socialId = "socialId"

class MenuFooterCell: BaseCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let icons = ["facebook", "twitter", "pinterest", "snapchat"]
    
    lazy var socialMediaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    var menuController: MenuController?
    
    override func setupViews() {
        addSubview(socialMediaCollectionView)
        socialMediaCollectionView.register(SocialMediaCell.self, forCellWithReuseIdentifier: socialId)
        
        addConstraintsWithFormat(format: "H:|-\(frame.width * 0.13)-[v0]-\(frame.width * 0.13)-|", views: socialMediaCollectionView)
        addConstraintsWithFormat(format: "V:[v0(\(frame.width * 0.25))]-0-|", views: socialMediaCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Direct social media
        menuController?.handleFooterDirect(socialMedia: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: socialId, for: indexPath) as! SocialMediaCell
        cell.iconImageView.image = UIImage(named: icons[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // collection view width = 70% of screen
        return CGSize(width: frame.height * 0.2, height: frame.height * 0.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


