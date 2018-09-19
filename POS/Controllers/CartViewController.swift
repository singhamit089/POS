//
//  CartViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/13/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var tableViewCart: UITableView!
    
    @IBOutlet weak var buttonClearData: UIButton!
    
    @IBOutlet weak var buttonTotalCharge: UIButton!
    
    var cartArray:[Cart]!
    
    var footerView:CartFooterTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Shopping Cart"

        NotificationCenter.default.addObserver(self, selector: #selector(cartUpdated), name: NSNotification.Name(IdentifyingKeys.cartUpdated.rawValue), object: nil)
        
        tableViewCart.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        tableViewCart.register(UINib(nibName: "CartFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "CartFooterTableViewCell")
        
        footerView = tableViewCart.dequeueReusableCell(withIdentifier: "CartFooterTableViewCell") as! CartFooterTableViewCell
        
        tableViewCart.tableFooterView = footerView.contentView
        
        self.cartUpdated()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func cartUpdated()  {
        
        self.cartArray = DataProvider.sharedInstance.storageManager.fetchAllCartItem()
        self.tableViewCart.reloadData()
        
        if let count = cartArray?.count, count > 0 {
            self.buttonClearData.isHidden = false
        }else{
            self.buttonClearData.isHidden = true
        }
        
        let subTotal = self.cartArray.reduce(into: Double(0)) { (subTotal, cart) in
            subTotal += cart.price
        }
        footerView.labelSubtotal.text = "\(subTotal)"
        
        let discountTotal = self.cartArray.reduce(into: Double(0)) { (discountTotal, cart) in
            let discountedAmount = cart.price * ((cart.discounts?.value ?? 0)/100)
            discountTotal += discountedAmount
        }
        footerView.labelTotalDiscount.text = "\(discountTotal)"
        
        let totalPayableAmount = subTotal - discountTotal
        let titleText = totalPayableAmount > 0 ? "Charge $\(totalPayableAmount)" : "Charge"
        self.buttonTotalCharge.titleLabel?.numberOfLines = 0
        self.buttonTotalCharge.setTitle(titleText, for: .normal)
    }

    @IBAction func buttonClearDataTapAction(_ sender: Any) {
        DataProvider.sharedInstance.storageManager.deleteAllObjectsForEnity(entity: Cart.self)
        cartUpdated()
    }
    
    @IBAction func buttonTotalChargeTapAction(_ sender: Any) {
        
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        if let count = cartArray?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        
        let cart = cartArray[indexPath.row] as Cart
        
        cell.labelItem.text = cart.items?.title
        cell.labelPrice.text = "\(cart.price)"
        cell.labelQuantity.text = "x\(cart.quantity)"
        
        return cell
    }
    
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cartStoryboard = UIStoryboard(name: "Library", bundle: nil)
        let addItemViewControlelr = cartStoryboard.instantiateViewController(withIdentifier: "AddItemViewController") as! AddItemViewController
        addItemViewControlelr.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        addItemViewControlelr.modalPresentationStyle = .overFullScreen
        addItemViewControlelr.cart = cartArray[indexPath.row]
        navigationController?.present(addItemViewControlelr, animated: false, completion: nil)
    }
}
