//
//  DiscoutViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class DiscoutViewController: UIViewController {
    @IBOutlet var tableViewDiscount: UITableView!

    var dataSourceArray = DiscountModel.getDiscountDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewDiscount.register(UINib(nibName: "DiscountTableViewCell", bundle: nil), forCellReuseIdentifier: "DiscountTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DiscoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 60.0
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return dataSourceArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountTableViewCell") as! DiscountTableViewCell
        cell.setCell(with: dataSourceArray[indexPath.row])
        return cell
    }
}
