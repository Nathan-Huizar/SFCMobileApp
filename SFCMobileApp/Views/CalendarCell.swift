//
//  CalendarCell.swift
//  SFCMobileApp
//
//  Created by Nathan Huizar on 11/5/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class calendarCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //simpler layuot for the menu 
    //an array of page objects which are UIImages
    let pages: [Page] = {
        
        let firstImage = Page(imageName: "image1")
        
        let secondImage = Page(imageName: "image2")
        
        let thirdImage = Page(imageName: "image3")
        
        let fourthImage = Page(imageName: "image4")
        
        
        
        //returns the array of UIImages which are the web slider images
        return [firstImage, secondImage, thirdImage, fourthImage]
        
    }()
    
    private let cellId = "imageCellId"
    
    override init (frame: CGRect){
        super.init(frame:frame)
        setupViews()
    }

    //allows for there to be a collectionview inside of the already rendered cell
    let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
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
    
    //returns the number of pages made from the pages array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! imageCell
        
        //accesses the images from the pages struct
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
        
    }

    //the second collection view will be the width and height of the first collection view 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//allows for the images to accessed
class imageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{
            
            guard let page = page else{
                return
            }
            
            //the images being accessed are the imageNames of the pages we created
            imageView.image = UIImage(named: page.imageName)
            
        }
        
    }
    
    
    override init (frame: CGRect){
        super.init(frame:frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //lets us see what image will be rendered
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image1")
        iv.contentMode = .scaleAspectFill
        //iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        return iv
    }()
    
    
    func setUpViews() {
        addSubview(imageView)
        
    //controls h and w for the image
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
}

