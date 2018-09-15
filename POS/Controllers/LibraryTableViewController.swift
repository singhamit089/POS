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
        
        self.title = "All Items"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSourceArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCellReuseIdentifier", for: indexPath)

        cell.textLabel?.text = dataSourceArray[indexPath.row].title
        cell.imageView?.image = UIImage(named: dataSourceArray[indexPath.row].logo)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            let viewControlelr = self.storyboard?.instantiateViewController(withIdentifier: "DiscoutViewController") as! DiscoutViewController
            self.navigationController?.pushViewController(viewControlelr, animated: true)
            
        case 1:
            print("1 Selected")
        default:
            print("Default Selected")
        }
    }
}
