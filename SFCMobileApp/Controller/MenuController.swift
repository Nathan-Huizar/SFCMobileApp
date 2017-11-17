//
//  MenuController.swift
//  SFCMobileApp
//
//  Created by Christopher Villanueva on 11/8/17.
//  Copyright © 2017 Nathan Huizar. All rights reserved.
//

import UIKit

private let headerId = "headerId"
private let bodyId = "bodyId"
private let footerId = "footerId"

class MenuController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var homeController: HomeController?
    
    let bodyLabels = ["Home", "Check-In", "FAQ", "Understanding MyBill", "About Us", "Settings"]
    let bodyIcons = ["home", "checkin", "faq", "mybill", "aboutus", "settings"]
    
    lazy var dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        return view
    }()
    
    lazy var backgroundView: UIImageView = {
        let view = UIImageView()
    //    view.backgroundColor = UIColor(red: 0.0353, green: 0.1843, blue: 0.2667, alpha: 1.0)
        view.image = UIImage(named: "menu_background")
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        self.collectionView?.register(MenuHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView!.register(MenuBodyCell.self, forCellWithReuseIdentifier: bodyId)
        self.collectionView?.register(MenuFooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
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
            let menuWidth = window.frame.width * 0.75
            
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
    
    @objc func handleLogout(){
        print("Logout")
    }
    
    func handleFooterDirect(socialMedia: Int){
        switch socialMedia {
        case 0:
            print("Facebook")
        case 1:
            print("Twitter")
        case 2:
            print("Pinterest")
        case 3:
            print("Snapchat")
        default:
            assert(false, "directing error")
        }
    }
    
    // Header - Collection View
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: view.frame.height * 0.4)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MenuHeaderCell
            header.logoutTextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleLogout)))
            return header
        case UICollectionElementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! MenuFooterCell
            footer.menuController = self
            return footer
        default:
            assert(false, "Unexpected Kind")
        }
    }
    //
    
    // Body - Collection View
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bodyId, for: indexPath) as! MenuBodyCell
        cell.labelTextView.text = bodyLabels[indexPath.item]
        cell.iconImageView.image = UIImage(named: bodyIcons[indexPath.item])?.withRenderingMode(.alwaysOriginal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: view.frame.height * 0.05)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // footer
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        // Total Height MINUS Height of the header pLUS height each body cell TIMES number of body cells
        let footerHeight = view.frame.height - (view.frame.height * 0.7)
        return CGSize(width: collectionView.frame.width, height: footerHeight)
    }
    
}

