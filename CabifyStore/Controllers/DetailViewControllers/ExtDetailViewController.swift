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
        
        if self.detailArrayData[indexPath.row].products[0].name == "Cabify T-Shirt" {
            cell.lblName.text = "Cabify T-Shirt" //self.detailArrayData[0].products[0].name
            cell.lblQuantity.text = String(tshirt.count)
            if tshirt.count > 2  {
                cell.lblPrice.text = String( 19 * Double(self.tshirt.count))
                print( String( 19 * Double(tshirt.count)))
                self.tshirtDiscount = Double(1 * self.tshirt.count)
                self.tshirttotal = Double( 19 * Double(self.tshirt.count))
            } else {
                cell.lblPrice.text = String( self.detailArrayData[indexPath.row].products[0].price * Double(tshirt.count))
                print(String( self.detailArrayData[indexPath.row].products[0].price * Double(tshirt.count)))
                self.tshirttotal = Double( self.detailArrayData[indexPath.row].products[0].price * Double(tshirt.count))
            }
  
        }

        if  self.detailArrayData[indexPath.row].products[0].name == "Cabify Coffee Mug"  {
            cell.lblName.text = "Cabify Coffee Mug"//self.detailArrayData[indexPath.row].products[0].name
            cell.lblQuantity.text = String(self.mug.count)
            cell.lblPrice.text = String( self.detailArrayData[indexPath.row].products[0].price * Double(mug.count))
            self.mugtotal = Double( self.detailArrayData[indexPath.row].products[0].price * Double(mug.count))
        
        }

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
        lblDiscountPrice.text = String(self.dicountPlus) + " €"
        lblTotalPrice.text = String(self.totalPlus) + " €"
       
        cell.backgroundColor = .clear
        tableView.backgroundColor  = .clear
        cell.lblName.textColor = .white
        cell.lblQuantity.textColor = .white
        cell.lblPrice.textColor = .white
        cell.selectionStyle = .none
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(tapDelete(_:)), for: .touchUpInside)
        cell.btnMinus.addTarget(self, action: #selector(tapMinus(_:)), for: .touchUpInside)
//        cell.btnPlus.addTarget(self, action: #selector(tapDelete), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        print(">>>",self.detailArrayData[index].products[0].name)
        
        
        let cell = self.tableView.cellForRow(at: indexPath as IndexPath)
        print("The text is \(String(describing: cell))")
        
    }
    
    
    
    
}
