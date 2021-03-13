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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDetail", for: indexPath) as! DetailTableViewCell
        cell.backgroundColor = .clear
        tableView.backgroundColor  = .clear
        
        cell.lblName.text = "T-SHIRT"
        cell.lblQuantity.text = "3"
        cell.lblPrice.text = "34,00€"
        
        cell.lblName.textColor = .white
        cell.lblQuantity.textColor = .white
        cell.lblPrice.textColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
    
    
}
