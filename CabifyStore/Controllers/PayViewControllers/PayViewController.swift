//
//  PayViewController.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 11/3/21.
//

import UIKit

class PayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
  
    }
    
    func addNavBarImage() {
        let image = UIImage(named: "Logo")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 170, height: 50)
        imageView.contentMode = .scaleAspectFit
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        titleView.addSubview(imageView)
        titleView.backgroundColor = .clear
        self.navigationItem.titleView = titleView
        
    }


}
