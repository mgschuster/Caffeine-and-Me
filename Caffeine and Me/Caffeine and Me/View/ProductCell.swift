//
//  ProductCell.swift
//  Caffeine and Me
//
//  Created by Mitchell Schuster on 11/2/21.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCaf: UILabel!
    
    func updateViews(product: Product) {
        productImage.image = UIImage(named: product.imageName)
        productImage.layer.cornerRadius = 11
        productTitle.text = product.title
        productCaf.text = product.caffeineContent
    }
    
    
}
