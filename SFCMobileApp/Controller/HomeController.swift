//
//  ViewController.swift
//  SFCMobileApp
//
//  Created by Nathan Huizar on 10/18/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
        
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        //the view of the collection view
        collectionView.frame = view.frame
        
        
       /* //header
        navigationItem.title = "Students First Center"
        navigationController?.navigationBar.isTranslucent = false
        
        
        //sfc logo view in nav bar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 400, height: view.frame.height))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "sfc_logo")
        imageView.image = image
        navigationItem.titleView = imageView
        

      
         
         setupNavBarButtons() */
        
    }
    
  /*  //navigationBarItems(menu and search bar)
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
    */
}



extension UIView {
    
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
    
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant : 0, leftConstant : 0, bottomConstant: 0, rightConstant: 0)
        
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
    
    translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
       
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }
        
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: rightConstant).isActive = true
        }
        
        
}

}









