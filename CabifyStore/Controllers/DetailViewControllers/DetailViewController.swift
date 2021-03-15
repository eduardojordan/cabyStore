//
//  DetailViewController.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 11/3/21.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnPay: UIButton!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    
    var detailArrayData = [Products]()
    var dicountPlus: Double = 0.0
    var totalPlus: Double = 0.0
    var tshirtDiscount: Double = 0.0
    var voucherDiscount: Double = 0.0
    var tshirttotal: Double = 0.0
    var vouchertotal: Double = 0.0
    var mugtotal: Double = 0.0
    var tshirt = [Products]()
    var mug = [Products]()
    var voucher = [Products]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        setupButton()
        setupTableView()
        setupLabels()
        setupLabels()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
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
    
    func setupTableView() {
        tableView.backgroundColor = .clear
    }

    func setupLabels() {
        lblDiscount.text = localizedString("text_discount")
        lblTotal.text = localizedString("text_total")
        lblTotalPrice.text = "0.00 €"
        lblDiscountPrice.text = "0.00 €"
        lblDiscountPrice.textColor = .white
        lblTotal.textColor = .white
        lblDiscount.textColor = .white
        lblDiscountPrice.textColor = .white
        lblTotalPrice.textColor = .white
        
    }
    
    func setupNavigationBar() {
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func  setupButton() {
        btnPay.layer.cornerRadius = 20
        btnPay.setTitle(localizedString("text_pay"), for: .normal)
        
    }
    
    func loadData() -> [EntityProducts] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<EntityProducts> = EntityProducts.fetchRequest()
        do {
            let products = try context.fetch(request)
            products.forEach { article in
                guard let name = article.name, let price = article.price
                else {
                    fatalError()
                }
                self.detailArrayData.append(Products(products: [Product(code: name, name: name, price: Double(price)!)]))
                self.filterProducts()
                tableView.reloadData()
            }
            return products
            
        } catch  {
            print(error)
        }
        return []
    }
    
    
    func filterProducts() {
        self.tshirt = self.detailArrayData.filter{ $0.products[0].name == "Cabify T-Shirt"}
        self.mug = self.detailArrayData.filter{ $0.products[0].name == "Cabify Coffee Mug"}
        self.voucher = self.detailArrayData.filter{ $0.products[0].name == "Cabify Voucher"}
        
    }
    
//    func saveData() {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//        let context = appDelegate.persistentContainer.viewContext
//        let product = EntityProducts(context: context)
//        product.name = self.dataName
//        product.price = self.dataPrice
//        appDelegate.saveContext()
//
//    }
    
    @objc func tapMinus(_ sender: UIButton) {
        //        MARK: REALIZAR OPERACION PARA ELIMINAR CANTIDAD DE PRODUCTOS
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        let context = appDelegate.persistentContainer.viewContext
//        let index = sender.tag
//        let productos =  loadData()
//        context.delete(productos[index] as NSManagedObject)
//
//        self.detailArrayData.removeAll()
//        let _ : NSError! = nil
//        do {
//            try context.save()
//            DispatchQueue.main.async {
//                self.loadData()
//                self.tableView.reloadData()
//            }
//        } catch {
//            print("error : \(error)")
//        }
        
    }
    
    @objc func tapPlus() {
//        MARK: REALIZAR OPERACION PARA AUMENTAR CANTIDAD DE PRODUCTOS
    }
    
    @objc func tapDelete(_ sender: UIButton) {

        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let index = sender.tag
        let productos =  loadData()
        context.delete(productos[index] as NSManagedObject)
        self.detailArrayData.removeAll()
//        self.arrayProducts.removeAll()
//        self.filterProducts()
//        print("CANT",self.detailArrayData.count)
        let _ : NSError! = nil
        do {
            try context.save()

            DispatchQueue.main.async {
                self.loadData()
//                self.filterProducts()
                self.filterProducts()
                self.tableView.reloadData()
//                print("CANT",self.detailArrayData.count)
            }
        } catch {
            print("error : \(error)")
        }
        
    }
//    MARK: TODO FIX BUG WHEN ELIMINATE 
}






