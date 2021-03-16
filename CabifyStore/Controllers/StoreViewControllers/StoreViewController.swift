//
//  StoreViewController.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 11/3/21.
//

import UIKit
import CoreData

class StoreViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblPromo: UILabel!
    
    var arrayImages = [UIImage]()
    var productName = String()
    var productPrice = [String]()
    var products = [Products]()
    var carIsEmpty = true
    var dataPrice = String()
    var dataName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entityIsEmpty()
        setupRightNavImage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        entityIsEmpty()
        getProductInfo()
        addNavBarImage()
        setupRightNavImage()
        setupNavigationBar()
        setupButtons()
        
    }
    
    func getProductInfo() {
        Request.shared.getRequest { [self] (result) in
            products.append(result)
            DispatchQueue.main.async { [self] in
                addTappedTSHIRT()
            }
        }
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
        
        // MARK: RED BADGE
        if carIsEmpty == false {
            let redPoint = UIImageView(frame: CGRect(x: 25, y: -3, width: 13, height: 13))
            redPoint.image = UIImage(named: "redPoint")
            redPoint.contentMode = UIView.ContentMode.scaleAspectFit
            imageview.addSubview(redPoint)
        }
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showShoppingCar))
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
        
        btn1.setTitle(localizedString("text_tshirt"), for: .normal)
        btn2.setTitle(localizedString("text_mugs"), for: .normal)
        btn3.setTitle(localizedString("text_voucher"), for: .normal)
        btnAdd.setTitle(localizedString("text_add"), for: .normal)
        
        btn1.addTarget(self, action: #selector(addTappedTSHIRT), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(addTappedMUG), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(addTappedVOUCHER), for: .touchUpInside)
        btnAdd.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
    }
    
    @objc func showShoppingCar() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.navigationController!.pushViewController(nextViewController, animated: true)
        
    }
    
    @objc func addTappedTSHIRT() {
        for item in products[0].products {
            if item.code == "TSHIRT" {
                self.productName = item.name
                self.productPrice = ["\(item.price)" + "0", "\(item.price)" + "0"]
            }
        }
        lblPromo.text = localizedString("text_promo_tshirt")
        arrayImages.removeAll()
        arrayImages = [UIImage(named: "Tshirt")!, UIImage(named: "TshirtWhite")!]
        collectionView.reloadData()
        
    }
    
    @objc func addTappedMUG() {
        for item in products[0].products {
            if item.code == "MUG" {
                self.productName = item.name
                self.productPrice = ["\(item.price)" + "0"]
            }
        }
        lblPromo.text = localizedString("text_promo_mug")
        arrayImages.removeAll()
        arrayImages = [UIImage(named: "Mug")!]
        collectionView.reloadData()
        
    }
    
    @objc func addTappedVOUCHER() {
        for item in products[0].products {
            if item.code == "VOUCHER" {
                self.productName = item.name
                self.productPrice = ["\(item.price)" + "0"]
            }
        }
        lblPromo.text = localizedString("text_promo_voucher")
        arrayImages.removeAll()
        arrayImages = [UIImage(named: "Voucher5")!]
        collectionView.reloadData()
        
    }
    
    @objc func addProduct(_ sender:UIButton) {
        if let collectionView = self.collectionView,
           let indexPath = collectionView.indexPathsForSelectedItems?.first,
           let cell = collectionView.cellForItem(at: indexPath) as? StoreCollectionViewCell,
           let dataPrice = cell.lblSale.text, let dataName = cell.lblDescription.text {
            self.dataPrice = "\(dataPrice)"
            self.dataName = "\(dataName)"
        }
        saveData()
        self.carIsEmpty = false
        setupRightNavImage()
        
        let pulse = PulseAnimation(numberOfPulse: 1, radius: 200, postion: sender.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    
    func saveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let product = EntityProducts(context: context)
        product.name = self.dataName
        product.price = self.dataPrice
        appDelegate.saveContext()
        
    }
    
    func entityIsEmpty() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<EntityProducts> = EntityProducts.fetchRequest()
        do {
            let products = try context.fetch(request)
            self.carIsEmpty = true
            products.forEach { article in
                guard let name = article.name
                else {
                    print(Error.self)
                    fatalError()
                }
                print(name)
                if article.name != nil {
                    self.carIsEmpty = false
                }
            }
        } catch  {
            print(error)
        }
    }
    
}

