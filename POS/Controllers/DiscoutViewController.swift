//
//  DiscoutViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class DiscoutViewController: UIViewController {

    @IBOutlet weak var tableViewDiscount: UITableView!
    
    var dataSourceArray = DiscountModel.getDiscountDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewDiscount.register(UINib(nibName: "DiscountTableViewCell", bundle: nil), forCellReuseIdentifier: "DiscountTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DiscoutViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountTableViewCell") as! DiscountTableViewCell
        
        cell.ImageViewLogo.image = UIImage(named: self.dataSourceArray[indexPath.row].logo)
        cell.labelTitle.text = self.dataSourceArray[indexPath.row].title
        cell.labelDiscount.text = "\(self.dataSourceArray[indexPath.row].discount) %"
        
        return cell
    }
}
