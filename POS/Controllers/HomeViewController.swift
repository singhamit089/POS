//
//  HomeViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/13/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let loadingViewController = LoadingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add(loadingViewController)
        
        DataProvider.sharedInstance.getProductList { (result) in
            switch result {
            case .Success(_):
                self.loadingViewController.remove()
            case .Error(let error):
                print("API Error")
                self.loadingViewController.remove()
                
                let errorViewController = ErrorViewController(error: error)
                self.add(errorViewController)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadProducts() {
        
    }

}
