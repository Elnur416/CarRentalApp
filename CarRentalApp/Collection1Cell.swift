//
//  Collection1Cell.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//

import UIKit

class Collection1Cell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categorySize: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 20
    }
    
    func configure(image: String, name: String, size: String) {
        carImage.image = UIImage(named: image)
        categoryName.text = name
        categorySize.text = size
    }
}

