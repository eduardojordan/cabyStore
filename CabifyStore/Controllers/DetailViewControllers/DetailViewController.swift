//
//  DetailViewController.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 11/3/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var btnPay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        setupButton()
        
  
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
    
    func setupNavigationBar() {
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func  setupButton() {
        btnPay.layer.cornerRadius = 20
        btnPay.setTitle("PAY", for: .normal)
    
      
      }



}
