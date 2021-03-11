//
//  StoreViewController.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 11/3/21.
//

import UIKit

class StoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        setupRightNavImage()
        setupNavigationBar()
        
    }
    
    func addNavBarImage() {
        let image = UIImage(named: "Logo")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        imageView.contentMode = .scaleAspectFit
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 40))
        titleView.addSubview(imageView)
        titleView.backgroundColor = .clear
        self.navigationItem.titleView = titleView
        
    }
    
    func setupRightNavImage() {
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageview.image = UIImage(named: "ShopCarWhite")
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        containView.addSubview(imageview)
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addTapped))
        gesture.numberOfTapsRequired = 1
        containView.isUserInteractionEnabled = true
        containView.addGestureRecognizer(gesture)
        
        
    }
    
    func setupNavigationBar() {
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @objc func addTapped() {
        print("PRESS")
    }
}
