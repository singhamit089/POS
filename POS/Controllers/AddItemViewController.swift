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

    var cart:Cart? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "DiscountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscountCollectionViewCell")
        
        labelQuantity.layer.borderWidth = 1.0
        labelQuantity.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    func updateUI() {
        self.labelItemName.text = cart?.items?.title
        self.labelQuantity.text = "\(cart?.quantity ?? 0)"
        self.labelItemPrice.text = "$ \(cart?.price ?? 0)"
    }

    @IBAction func cancleButtonAction(_: Any) {
        DataProvider.sharedInstance.storageManager.remove(objectID: (cart?.objectID)!)
        dismiss(animated: false, completion: nil)
    }

    @IBAction func saveButonAction(_: Any) {
        DataProvider.sharedInstance.storageManager.save()
        NotificationCenter.default.post(name: NSNotification.Name(NotificationName.cartUpdated.rawValue), object: nil)
        dismiss(animated: false, completion: nil)
    }

    @IBAction func stepperAction(_: Any) {
    }

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
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscountCollectionViewCell", for: indexPath) as! DiscountCollectionViewCell
        
        cell.labelDiscount.text = "Discount"
        
        return cell
    }
}
