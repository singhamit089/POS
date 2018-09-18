//
//  CartViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/13/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Shopping Cart"

        NotificationCenter.default.addObserver(self, selector: #selector(cartUpdated), name: NSNotification.Name(NotificationName.cartUpdated.rawValue), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func cartUpdated()  {
        print("Cart Updated!... fetching data!")
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
