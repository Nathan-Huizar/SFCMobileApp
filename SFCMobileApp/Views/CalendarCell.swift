//
//  CalendarCell.swift
//  SFCMobileApp
//
//  Created by Nathan Huizar on 11/5/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class calendarCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "imageCellId"
    
    override init (frame: CGRect){
        super.init(frame:frame)
        setupViews()
    }

    //allows for there to be a collectionview inside of the already rendered cell
    let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    

    func setupViews(){
        backgroundColor = UIColor.clear
        addSubview(imageCollectionView)
        
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        
        imageCollectionView.register(imageCell.self, forCellWithReuseIdentifier: cellId)

        //adjusting the image inside of the first collection view
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v0]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageCollectionView]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v0]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageCollectionView]))
        

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class imageCell: UICollectionViewCell {
    
    
    
    override init (frame: CGRect){
        super.init(frame:frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image2")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    
    func setUpViews() {
        addSubview(imageView)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width - 140)
    }
    
}

