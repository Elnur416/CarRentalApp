//
//  Collection2Cell.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//

import UIKit

class Collection2Cell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var engineModel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 20
    }
    
    func configure(data: CarList) {
        brandName.text = data.brand
        modelName.text = data.name
        price.text = data.price
        engineModel.text = data.engine
        carImage.image = UIImage(named: data.image ?? "")
    }
}
