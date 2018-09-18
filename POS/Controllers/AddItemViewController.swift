//
//  AddItemViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/18/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title =  "Add Item"
        
        let rightButtonItem = UIBarButtonItem.init(
            title: "Save",
            style: .done,
            target: self,
            action: Selector(("rightButtonAction:"))
        )
        
        let leftButtonItem = UIBarButtonItem.init(
            title: "Cancle",
            style: .done,
            target: self,
            action: Selector(("leftButtonAction:"))
        )
        
        self.navigationItem.rightBarButtonItem = rightButtonItem
        self.navigationItem.leftBarButtonItem = leftButtonItem
        
        // Do any additional setup after loading the view.
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem){
        print("Right Button Pressed")
    }
    
    @objc func leftButtonAction(sender: UIBarButtonItem){
        print("Left Button Pressed")
        self.remove()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
