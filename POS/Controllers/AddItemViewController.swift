//
//  AddItemViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/18/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet var labelItemName: UILabel!
    @IBOutlet var labelItemPrice: UILabel!
    @IBOutlet var labelQuantity: UILabel!
    @IBOutlet var stepper: UIStepper!

    @IBOutlet var collectionView: UICollectionView!

    var cart: Cart?

    let discountArray = DataProvider.sharedInstance.storageManager.fetchAllDiscount()
    typealias DataSource = (discount: Discount, selected: Bool)
    var dataSourceArray: Array<DataSource>!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewController()

        collectionView.register(UINib(nibName: "DiscountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscountCollectionViewCell")
    }

    func setUpViewController() {
        dataSourceArray = discountArray.map({ discountObject -> DataSource in
            if let id = self.cart?.discounts?.id, discountObject.id == id {
                return (discount: discountObject, selected: true)
            } else {
                return (discount: discountObject, selected: false)
            }
        })

        labelQuantity.layer.borderWidth = 1.0
        labelQuantity.layer.cornerRadius = 8
    }

    override func viewWillAppear(_: Bool) {
        updateUI()
    }

    func updateUI() {
        labelItemName.text = cart?.items?.title
        labelQuantity.text = "\(cart?.quantity ?? 0)"
        labelItemPrice.text = "$ \(cart?.price ?? 0)"
    }

    @IBAction func cancleButtonAction(_: Any) {
        DataProvider.sharedInstance.storageManager.remove(objectID: (cart?.objectID)!)
        dismiss(animated: false, completion: nil)
    }

    @IBAction func saveButonAction(_: Any) {
        DataProvider.sharedInstance.storageManager.insertCart(with: cart!)
        NotificationCenter.default.post(name: NSNotification.Name(IdentifyingKeys.cartUpdated.rawValue), object: nil)
        dismiss(animated: false, completion: nil)
    }

    @IBAction func stepperAction(_: Any) {}

    @IBAction func stepperValueChangeAction(_ sender: UIStepper) {
        cart?.quantity = Int32(sender.value)

        if let q = cart?.quantity, let p = cart?.items?.price {
            cart?.price = Double(q) * p
        }
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AddItemViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return dataSourceArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscountCollectionViewCell", for: indexPath) as! DiscountCollectionViewCell

        let discount = dataSourceArray[indexPath.row].discount
        cell.labelDiscount.text = "\(discount.name ?? "Discount") (\(discount.value)%)"
        cell.switch.setOn(dataSourceArray[indexPath.row].selected, animated: false)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSourceArray = dataSourceArray.map({ (dataSource: DataSource) -> DataSource in
            var ds = dataSource
            ds.selected = false
            return ds
        })
        dataSourceArray[indexPath.row].selected = true
        cart?.discounts = dataSourceArray[indexPath.row].discount
        collectionView.reloadData()
    }
}
