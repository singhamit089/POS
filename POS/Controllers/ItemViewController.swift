//
//  ItemViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var tableViewItem: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try DataProvider.sharedInstance.storageManager.fetchedhResultController.performFetch()
            print("COUNT FETCHED FIRST: \(String(describing: DataProvider.sharedInstance.storageManager.fetchedhResultController.sections?[0].numberOfObjects))")
        } catch let error  {
            print("ERROR: \(error)")
        }
        
        self.tableViewItem.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ItemViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = DataProvider.sharedInstance.storageManager.fetchedhResultController.fetchedObjects?.count{
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as! ItemTableViewCell
        
        if let item = DataProvider.sharedInstance.storageManager.fetchedhResultController.object(at: indexPath) as? Item {
            cell.setItemCell(item: item)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addItemViewControlelr = self.storyboard?.instantiateViewController(withIdentifier: "AddItemViewController") as! AddItemViewController
        self.navigationController?.present(addItemViewControlelr, animated: true, completion: nil)
    }
}
