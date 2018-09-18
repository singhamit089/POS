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

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(DiscountCollectionViewCell.self, forCellWithReuseIdentifier: "DiscountCollectionViewCell")
    }

    @IBAction func cancleButtonAction(_: Any) {
        dismiss(animated: false, completion: nil)
    }

    @IBAction func saveButonAction(_: Any) {}

    @IBAction func stepperAction(_: Any) {}

    @IBAction func stepperValueChangeAction(_: Any) {}

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

        return cell
    }
}
