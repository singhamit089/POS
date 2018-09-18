//
//  ItemViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    @IBOutlet var tableViewItem: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try DataProvider.sharedInstance.storageManager.fetchedhResultController.performFetch()
            print("COUNT FETCHED FIRST: \(String(describing: DataProvider.sharedInstance.storageManager.fetchedhResultController.sections?[0].numberOfObjects))")
        } catch let error {
            print("ERROR: \(error)")
        }

        tableViewItem.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 100.0
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        if let count = DataProvider.sharedInstance.storageManager.fetchedhResultController.fetchedObjects?.count {
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

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addItemViewControlelr = storyboard?.instantiateViewController(withIdentifier: "AddItemViewController") as! AddItemViewController
        addItemViewControlelr.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        addItemViewControlelr.modalPresentationStyle = .overFullScreen
        addItemViewControlelr.cart = DataProvider.sharedInstance.storageManager.getCart(with: (DataProvider.sharedInstance.storageManager.fetchedhResultController.object(at: indexPath) as! Item))
        navigationController?.present(addItemViewControlelr, animated: false, completion: nil)
    }
}
