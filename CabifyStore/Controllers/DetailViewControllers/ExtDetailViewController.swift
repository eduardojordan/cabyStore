//
//  ExtDetailViewController.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 13/3/21.
//

import Foundation
import UIKit

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let tshirt = self.detailArrayData.filter{ $0.products[0].name == "Cabify T-Shirt"}
//        let mug = self.detailArrayData.filter{ $0.products[0].name == "Cabify Coffee Mug"}
//        let voucher = self.detailArrayData.filter{ $0.products[0].name == "Cabify Voucher"}
        
        var arrayProducts = [Int]()
        
        if self.tshirt.count > 0 {
            arrayProducts.append(1)
        }
        if self.mug.count > 0 {
            arrayProducts.append(1)
        }        
        if self.voucher.count > 0 {
            arrayProducts.append(1)
        }

        return arrayProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDetail", for: indexPath) as! DetailTableViewCell
       
//        let tshirt = self.detailArrayData.filter{ $0.products[0].name == "Cabify T-Shirt"}
        if self.detailArrayData[indexPath.row].products[0].name == "Cabify T-Shirt" {
            cell.lblName.text = "Cabify T-Shirt" //self.detailArrayData[0].products[0].name
            cell.lblQuantity.text = String(tshirt.count)
            if tshirt.count > 2  {
                cell.lblPrice.text = String( 19 * Double(self.tshirt.count))
                print( String( 19 * Double(tshirt.count)))
                self.tshirtDiscount = Double(1 * self.tshirt.count)
                self.tshirttotal = Double( 19 * Double(self.tshirt.count))
            }else {
                cell.lblPrice.text = String( self.detailArrayData[indexPath.row].products[0].price * Double(tshirt.count))
                print(String( self.detailArrayData[indexPath.row].products[0].price * Double(tshirt.count)))
                self.tshirttotal = Double(self.tshirt.count)
            }
  
        } 
//
//        let mug = self.detailArrayData.filter{ $0.products[0].name == "Cabify Coffee Mug"}
        if  self.detailArrayData[indexPath.row].products[0].name == "Cabify Coffee Mug"  {
            cell.lblName.text = "Cabify Coffee Mug"//self.detailArrayData[indexPath.row].products[0].name
            cell.lblQuantity.text = String(self.mug.count)
            cell.lblPrice.text = String( self.detailArrayData[indexPath.row].products[0].price * Double(mug.count))
            self.mugtotal = Double( self.detailArrayData[indexPath.row].products[0].price * Double(mug.count))
        
        }

//        let voucher = self.detailArrayData.filter{ $0.products[0].name == "Cabify Voucher"}
        if self.detailArrayData[indexPath.row].products[0].name == "Cabify Voucher" {
            cell.lblName.text = "Cabify Voucher"//self.detailArrayData[indexPath.row].products[0].name
            cell.lblQuantity.text = String(self.voucher.count * 2)
            cell.lblPrice.text = String( self.detailArrayData[indexPath.row].products[0].price  / 2)
            print(indexPath.row)
            self.voucherDiscount =  self.detailArrayData[indexPath.row].products[0].price / 2
            self.vouchertotal = Double( self.detailArrayData[indexPath.row].products[0].price  / 2)

        }
        self.dicountPlus = self.tshirtDiscount + self.voucherDiscount
        self.totalPlus =  self.tshirttotal + self.mugtotal + self.vouchertotal
        
        print("self.dicountPlus",self.dicountPlus)
        
        lblDiscountPrice.text = String(self.dicountPlus) + " €"
        lblTotalPrice.text = String(self.totalPlus) + " €"
        
//        switch indexPath {
//        case tshirt:
//            let tshirt = self.detailArrayData.filter{ $0.products[0].name == "Cabify T-Shirt"}
//            cell.lblName.text = "Cabify T-Shirt"
//            cell.lblQuantity.text = tshirt.count
//        //                let tshirt = self.detailArrayData.filter{ $0.products[0].name == "Cabify T-Shirt"}
//        //                let mug = self.detailArrayData.filter{ $0.products[0].name == "Cabify Coffee Mug"}
//        //                let voucher = self.detailArrayData.filter{ $0.products[0].name == "Cabify Voucher"}
//        default:
//
//        }
        
//        cell.lblName.text = self.detailArrayData[indexPath.row].products[0].name//"T-SHIRT"
//        cell.lblQuantity.text = "3"
//        cell.lblPrice.text = String( self.detailArrayData[indexPath.row].products[0].price)//"34,00€"
       
        cell.backgroundColor = .clear
        tableView.backgroundColor  = .clear
        cell.lblName.textColor = .white
        cell.lblQuantity.textColor = .white
        cell.lblPrice.textColor = .white
        cell.selectionStyle = .none
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(tapDelete(_:)), for: .touchUpInside)
//        cell.btnMinus.addTarget(self, action: #selector(tapDelete), for: .touchUpInside)
//        cell.btnPlus.addTarget(self, action: #selector(tapDelete), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath as IndexPath)
        print("did select and the text is \(cell)")
    }
    
    
    
    
}
