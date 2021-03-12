//
//  StoreViewController.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 11/3/21.
//

import UIKit
//import PageMenu

class StoreViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let arrayTshirt = [UIImage(named: "Tshirt"), UIImage(named: "Tshirt")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNavBarImage()
        setupRightNavImage()
        setupNavigationBar()
        setupButtons()
        
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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    func setupButtons() {
        btn1.layer.cornerRadius = 10
        btn2.layer.cornerRadius = 10
        btn3.layer.cornerRadius = 10
        btnAdd.layer.cornerRadius = 20
        
        btn1.setTitle("T_SHIRTS", for: .normal)
        btn2.setTitle("MUGS", for: .normal)
        btn3.setTitle("VOUCHERS", for: .normal)
        btnAdd.setTitle("ADD", for: .normal)
        
        btn1.addTarget(self, action: #selector(addTappedTSHIRT), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(addTappedMUCK), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(addTappedVOUCHER), for: .touchUpInside)
        btnAdd.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
    }
    
    func setupCollection() {
        
    }
    
    @objc func addTapped() {
        print("PRESS")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        self.present(secondViewController, animated: true, completion: nil)
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.present(nextViewController, animated:true, completion:nil)
        

    }
    
    @objc func addTappedTSHIRT() {
        print("PRESS")
    }
    
    @objc func addTappedMUCK() {
        print("PRESS")
    }
    
    @objc func addTappedVOUCHER() {
        print("PRESS")
    }
}
