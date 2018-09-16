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
        
        DataProvider.sharedInstance.getProductList { (dataArray) in
            self.loadingViewController.remove()
        }
        
//        let service = APIService()
//        service.getDataWith { (result) in
//            switch result {
//            case .Success(let data):
//                self.loadingViewController.remove()
//                print("API Success")
//            case .Error(let error):
//                self.loadingViewController.remove()
//                let errorViewController = ErrorViewController(error: error)
//
//
//
//                self.add(errorViewController)
//                print("API Error")
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadProducts() {
        
    }

}
