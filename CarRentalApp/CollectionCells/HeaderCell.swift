//
//  Collection1Cell.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categorySize: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 20
    }
    
    func configure(category: CategoryList) {
        carImage.image = UIImage(named: category.image ?? "")
        categoryName.text = category.name
        categorySize.text = category.size
        configureView(isSelected: category.isSelected)
    }
    
    func configureView(isSelected: Bool) {
        view.backgroundColor = isSelected ? .systemBlue : .white
    }
}

