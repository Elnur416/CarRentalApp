//
//  Collection2Cell.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//

import UIKit

class Collection2Cell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 20
    }

}
