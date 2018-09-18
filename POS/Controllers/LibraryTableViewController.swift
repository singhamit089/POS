//
//  LibraryTableViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/13/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {
    let dataSourceArray = LibraryModel.getLibraryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "All Items"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return dataSourceArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCellReuseIdentifier", for: indexPath)

        cell.textLabel?.text = dataSourceArray[indexPath.row].title
        cell.imageView?.image = UIImage(named: dataSourceArray[indexPath.row].logo)
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:

            let viewControlelr = storyboard?.instantiateViewController(withIdentifier: "DiscoutViewController") as! DiscoutViewController
            navigationController?.pushViewController(viewControlelr, animated: true)

        case 1:

            let viewControlelr = storyboard?.instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            navigationController?.pushViewController(viewControlelr, animated: true)
        default:
            print("Default Selected")
        }
    }
}
