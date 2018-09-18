//
//  AddItemViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/18/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var labelItemName: UILabel!
    @IBOutlet weak var labelItemPrice: UILabel!
    @IBOutlet weak var labelQuantity: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(DiscountCollectionViewCell.self, forCellWithReuseIdentifier: "DiscountCollectionViewCell")
    }
   
    @IBAction func cancleButtonAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func saveButonAction(_ sender: Any) {
    }
    
    @IBAction func stepperAction(_ sender: Any) {
    }
    
    @IBAction func stepperValueChangeAction(_ sender: Any) {
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AddItemViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscountCollectionViewCell", for: indexPath) as! DiscountCollectionViewCell
        
        return cell
    }
}
