
//  ViewController.swift
//  SFCMobileApp

//  Created by Nathan Huizar on 10/18/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.


import UIKit

class HomeController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //header
        navigationController?.navigationBar.isTranslucent = false
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 400, height: view.frame.height))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "sfc_logo")
        imageView.image = image
        navigationItem.titleView = imageView
        
        
        
        //background color
        collectionView?.backgroundColor = UIColor.white


        
        setupNavBarButtons()
        
        
        
    }
    
    //navigationBarItems(menu and search bar)
    func setupNavBarButtons() {
        
        //set up the search bar as a button
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem =  UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        //set up the menu bar as a button
        let menuButton = UIBarButtonItem(image: UIImage(named:"menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearch))
        
        
        navigationItem.leftBarButtonItems = [menuButton]
        navigationItem.rightBarButtonItems = [searchBarButtonItem]
        
    }
    
    func handleMenu() {
        
        
    }
    
    @objc func handleSearch() {
        
        print(123)
        
    }
    
    
    
}

