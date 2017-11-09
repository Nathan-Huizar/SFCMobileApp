//
//  MenuController.swift
//  SFCMobileApp
//
//  Created by Christopher Villanueva on 11/8/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MenuController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var homeController: HomeController?

    lazy var dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        return view
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.0353, green: 0.1843, blue: 0.2667, alpha: 1.0)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func setupCollectionView(){
        collectionView?.backgroundColor = .clear
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleDismiss))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        collectionView?.addGestureRecognizer(swipeLeft)
    }
    
    // Displays the menu by animating it from the left onto the view
    func showMenu(){
        if let window = UIApplication.shared.keyWindow {
            if let cv = collectionView {
                window.addSubview(dimView)
                window.addSubview(backgroundView)
                window.addSubview(cv)
            } else {
                return
            }
            
            let menuHeight = window.frame.height
            let menuWidth = window.frame.width * 0.7
            
//            let blurEffect = UIBlurEffect(style: .light)
//            let blurEffectView = UIVisualEffectView(effect: blurEffect)
//            if let cvFrame = collectionView?.frame{
//                blurEffectView.frame = cvFrame
//                self.collectionView?.backgroundView = blurEffectView
//            }
            
            dimView.frame = window.frame
            dimView.alpha = 0
            
            collectionView?.frame = CGRect(x: -1 * menuWidth, y: 0, width: menuWidth, height: menuHeight)
            backgroundView.frame = CGRect(x: -1 * menuWidth, y: 0, width: menuWidth, height: menuHeight)
            UIView.animate(withDuration: 0.2, animations: {
                self.dimView.alpha = 1
                self.collectionView?.frame = CGRect(x: 0, y: 0, width: menuWidth, height: menuHeight)
                self.backgroundView.frame = CGRect(x: 0, y: 0, width: menuWidth, height: menuHeight)
            }, completion: nil)
        }
    }
    
    // Dismisses the menu by animating it off the view and to the left
    @objc func handleDismiss(){
        if let window = UIApplication.shared.keyWindow {
            let menuHeight = window.frame.height
            let menuWidth = window.frame.width * 0.75
            
            UIView.animate(withDuration: 0.2, animations: {
                self.dimView.alpha = 0
                self.collectionView?.frame = CGRect(x: -1 * menuWidth, y: 0, width: menuWidth, height: menuHeight)
                self.backgroundView.frame = CGRect(x: -1 * menuWidth, y: 0, width: menuWidth, height: menuHeight)
            }, completion: nil)
        }
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //            return nil
    //    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}

