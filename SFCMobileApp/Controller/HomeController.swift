//
//  ViewController.swift
//  SFCMobileApp
//
//  Created by Nathan Huizar on 10/18/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    var scrollView: UIScrollView!
    var containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //header
        navigationItem.title = "Students First Center"
        navigationController?.navigationBar.isTranslucent = false
        
        //Will move the navigation bar items
        /*let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 400, height: view.frame.height))
        titleLabel.text = "SFC"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        navigationItem.titleView = titleLabel*/
//
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 400, height: view.frame.height))
//        imageView.contentMode = .scaleAspectFit
//        let image = UIImage(named: "sfc_logo")
//        imageView.image = image
//        navigationItem.titleView = imageView
        

        //background color
        collectionView?.backgroundColor = UIColor.white
        
    collectionView?.register(calendarCell.self,forCellWithReuseIdentifier:"cellID")
      
         
         setupNavBarButtons()
    }
    
    //navigationBarItems(menu and search bar)
    func setupNavBarButtons() {
        
        //set up the search bar as a button
        let searchImage = UIImage(named: "search")
        let searchButtonItem =  UIButton(type: .custom)
        searchButtonItem.widthAnchor.constraint(equalToConstant: 64).isActive = true
        searchButtonItem.heightAnchor.constraint(equalToConstant: 100).isActive = true
        searchButtonItem.setImage(searchImage, for: .normal)
        
        //searchButtonItem.frame = CGRect(x: 0, y: 0, width: 16, height: 32)
        let searchBarButtonItem = UIBarButtonItem(customView: searchButtonItem)
        
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
    
    
    
        //number of cells we will be seeing
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        
        return cell
    }
    
        //responsible for the sizing of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
}




